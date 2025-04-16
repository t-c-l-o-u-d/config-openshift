#!/usr/bin/bash

FILE_LIST=$(find . -type f -name "*.bu")

for FILE in ${FILE_LIST}; do
    FILE_NAME=$(echo ${FILE} | sed --expression='s/\.bu//' --expression='s/^\.\///')
    butane ${FILE} -o ./${FILE_NAME}.yaml
done

oc apply -f ./100-master-blacklist-amdgpu.yaml

# time to apply mc and shutdown: ~7m
# time to boot: ~5m
source ~/.config/bash/functions && _show_wait_timer 720

oc apply -f ./100-master-kernel-arg-disable-efi-framebuffer.yaml

source ~/.config/bash/functions && _show_wait_timer 720

oc apply -f ./100-master-kernel-arg-enable-iommu.yaml

source ~/.config/bash/functions && _show_wait_timer 720

oc apply -f ./100-master-vfio-pci.yaml

source ~/.config/bash/functions && _show_wait_timer 720
#!/usr/bin/bash

FILE_LIST=$(find . -type f -name "*.bu")

for FILE in ${FILE_LIST};
do
    FILE_NAME=$(echo ${FILE} | sed --expression='s/\.bu//' --expression='s/^\.\///')
    butane ${FILE} -o ./${FILE_NAME}.yaml
done

oc apply -f ./100-master-blacklist-amdgpu.yaml

oc apply -f ./100-master-kernel-arg-disable-efi-framebuffer.yaml

oc apply -f ./100-master-kernel-arg-enable-iommu.yaml

oc apply -f ./100-master-vfio-pci.yaml
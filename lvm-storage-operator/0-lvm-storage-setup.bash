#!/usr/bin/bash

oc apply -f ./1-lvm-storage-namespace.yaml

oc apply -f ./2-lvm-storage-operatorgroup.yaml

oc apply -f ./3-lvm-storage-subscription.yaml

source ~/.bashrc-functions && show_wait_timer 60

oc apply -f ./4-lvm-storage-lvmcluster.yaml

source ~/.bashrc-functions && show_wait_timer 60
#!/usr/bin/bash

oc apply -f ./1-openshift-cnv-namespace.yaml

oc create -f ./2-openshift-cnv-operatorgroup.yaml

oc apply -f ./3-openshift-cnv-subscription.yaml

source ~/.config/bash/functions && _show_wait_timer 120

oc apply -f ./4-openshift-cnv-hyperconverged.yaml

source ~/.config/bash/functions && _show_wait_timer 300
#!/usr/bin/bash

oc create -f ./oauth.yaml

./generate-htpasswd-secret.bash

oc create secret generic htpasswd-secret --from-file=htpasswd=./htpasswd -n openshift-config

oc apply -f ./cluster-admin-tcloud.yaml
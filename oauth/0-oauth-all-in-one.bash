#!/usr/bin/bash

oc apply -f ./1-oauth.yaml

./2-generate-htpasswd-secret.bash

oc create secret generic htpasswd-secret --from-file=htpasswd=./htpasswd -n openshift-config

oc apply -f ./3-cluster-admin-for-admin.yaml
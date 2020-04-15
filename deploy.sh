#!/bin/bash

source ./env.sh

oc login ${OPENSHIFT_URL} -u ${OPENSHIFT_USR} -p ${OPENSHIFT_PSW} --insecure-skip-tls-verify=true

oc new-project ${OPENSHIFT_NS}

#####################################################################################
#####################################################################################

oc apply -f 00-service-account/

oc apply -f 01-rbacs/

oc apply -f 02-crds/

oc apply -f 03-deployments/

oc rollout status deployment/strimzi-cluster-operator

# oc apply -f 04-crs/00-ephemeral-kafka-cr.yaml

# sleep 10s;

# oc get sts/ephemeral-zookeeper --watch --request-timeout=30s

# oc get sts/ephemeral-kafka --watch --request-timeout=30s

# oc apply -f 04-crs/01-ephemeral-connect-cr.yaml

# oc delete project ${OPENSHIFT_NS}

# oc logout
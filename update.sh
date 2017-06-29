#!/bin/bash


if [ ! -z ${PLUGIN_KUBERNETES_SERVER} ]; then
  KUBERNETES_SERVER=$PLUGIN_KUBERNETES_SERVER
fi

if [ ! -z ${PLUGIN_KUBERNETES_USERNAME} ]; then
  KUBERNETES_USERNAME=$PLUGIN_KUBERNETES_USERNAME
fi

if [ ! -z ${PLUGIN_KUBERNETES_PASSWORD} ]; then
  KUBERNETES_PASSWORD=$PLUGIN_KUBERNETES_PASSWORD
fi


# Building the config and setting the context
kubectl config set-credentials default --username=${KUBERNETES_USERNAME} --password=${KUBERNETES_PASSWORD}
kubectl config set-cluster default --server=${KUBERNETES_SERVER} --insecure-skip-tls-verify=true
kubectl config set-context default --cluster=default --user=default
kubectl config use-context default

kubectl get pods

# kubectl version
# IFS=',' read -r -a DEPLOYMENTS <<< "${PLUGIN_DEPLOYMENT}"
# IFS=',' read -r -a CONTAINERS <<< "${PLUGIN_CONTAINER}"
# for DEPLOY in ${DEPLOYMENTS[@]}; do
#   echo Deploying to $KUBERNETES_SERVER
#   for CONTAINER in ${CONTAINERS[@]}; do
#     kubectl -n ${PLUGIN_NAMESPACE} set image deployment/${DEPLOY} \
#       ${CONTAINER}=${PLUGIN_REPO}:${PLUGIN_TAG} --record
#   done
# done

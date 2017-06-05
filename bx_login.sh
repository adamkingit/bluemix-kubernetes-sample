#!/bin/sh

envsubst <kubeConfig.yml >filledKubeConfig.yml
export KUBECONFIG=$(pwd)/filledKubeConfig.yml

if [ -n "$CLUSTER_NAMESPACE" ]; then
  kubectl config set-context $(kubectl config current-context) --namespace="$CLUSTER_NAMESPACE"
fi
echo "kubectl config view | grep namespace:"
kubectl config view | grep namespace:

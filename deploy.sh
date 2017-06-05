#!/bin/bash


export KUBECONFIG=$(pwd)/filledKubeConfig.yml
echo "KUBECONFIG== $KUBECONFIG"
if [ -n "$CLUSTER_NAMESPACE" ]; then
  kubectl config set-context "$CLUSTER_NAME" --namespace="$CLUSTER_NAMESPACE"
fi
echo "kubectl config view | grep namespace:"
kubectl config view | grep namespace:

echo "kubectl get namespaces"
kubectl get namespaces

echo "kubectl config get-contexts"
kubectl config get-contexts

echo "kubectl cluster-info"
kubectl cluster-info
echo "Create Guestbook"

echo -e "Downloading guestbook yml"
curl --silent "https://raw.githubusercontent.com/kubernetes/kubernetes/master/examples/guestbook/all-in-one/guestbook-all-in-one.yaml" > guestbook.yml

#Find the line that has the comment about the load balancer and add the nodeport def after this
let NU=$(awk '/^  # type: LoadBalancer/{ print NR; exit }' guestbook.yml)+3
NU=$NU\i
sed -i "$NU\ \ type: NodePort" guestbook.yml #For OSX: brew install gnu-sed; replace sed references with gsed

echo -e "Deleting previous version of guestbook if it exists"
kubectl delete --ignore-not-found=true   -f guestbook.yml

echo -e "Creating pods"
kubectl create -f guestbook.yml

PORT=$(kubectl get services | grep frontend | sed 's/.*:\([0-9]*\).*/\1/g')

echo ""
echo "View the guestbook at http://$IP_ADDR:$PORT"

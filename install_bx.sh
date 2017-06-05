#!/bin/bash

echo "Install kubectl"
mkdir /tmp/kube
wget --quiet --output-document=/tmp/kube/kubectl  https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x /tmp/kube/kubectl

export PATH="/tmp/kube:$PATH"

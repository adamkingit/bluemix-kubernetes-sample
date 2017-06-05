#!/bin/bash

echo "Install kubectl"
wget --quiet --output-document=/tmp/kubectl  https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x /tmp/kubectl

export PATH="/tmp/Bluemix_CLI/bin:$PATH"

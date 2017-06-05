#!/bin/sh

envsubst <kubeConfig.yml >filledKubeConfig.yml
export KUBECONFIG=$(pwd)/filledKubeConfig.yml

#!/bin/bash

source .env

cd ${KF_NAME}

wget -O kfctl_k8s_istio.yaml $CONFIG_URI

./kfctl apply -f kfctl_*.yaml



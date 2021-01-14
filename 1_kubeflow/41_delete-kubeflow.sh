#!/bin/bash

#cd ${KF_DIR}

#kfctl delete -V -f ${CONFIG_FILE}

kubectl delete all --all -n kubeflow
kubectl delete all --all -n istio-system
kubectl delete all --all -n knative-serving
kubectl delete all --all -n auth
kubectl delete all --all -n cert-manager


#!/bin/bash

export NAMESPACE=istio-system

kubectl port-forward -n ${NAMESPACE} svc/istio-ingressgateway 8080:80 &

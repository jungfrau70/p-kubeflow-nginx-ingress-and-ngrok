#!/bin/bash

source .env

mkdir ${KF_NAME}
cd ${KF_NAME}

curl -L -O ${KFCTL}

tar -xvf kfctl*

rm *.tar.gz

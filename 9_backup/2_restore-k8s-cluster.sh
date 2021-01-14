#!/bin/bash

# Restore certificates
sudo cp -r backup/pki /etc/kubernetes/

# Restore etcd backup
sudo rm -rf /var/lib/etcd
sudo mkdir -p /var/lib/etcd
sudo docker run --rm \
    -v $(pwd)/backup:/backup \
    -v /var/lib/etcd:/var/lib/etcd \
    --env ETCDCTL_API=3 \
    k8s.gcr.io/etcd:3.4.3-0 \
    /bin/sh -c "etcdctl snapshot restore '/backup/etcd-snapshot-latest.db' ; mv /default.etcd/member/ /var/lib/etcd/"

# Restore kubeadm-config
#sudo mkdir /etc/kubeadm
#sudo cp backup/kubeadm-config.yaml /etc/kubeadm/
sudo cp backup/admin.conf /etc/kubernetes/admin.yaml

# Initialize the master with backup
#sudo kubeadm init --ignore-preflight-errors=DirAvailable--var-lib-etcd \
#    --config /etc/kubernetes/admin.yaml

sudo kubeadm init --ignore-preflight-errors=DirAvailable--var-lib-etcd \
		  --pod-network-cidr=10.217.0.0/16


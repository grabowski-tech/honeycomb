#!/bin/bash
vagrant up
ansible-playbook make_cluster.yml
if [[ ! -d  ~/.honeycomb ]]; then mkdir ~/.honeycomb; fi
scp vagrant@192.168.5.10:/home/vagrant/.kube/config ~/.honeycomb/config > /dev/null

echo "*****************************************************"
echo "Check if cluster is running..."
echo "*****************************************************"
kubectl --kubeconfig ~/.honeycomb/config get nodes
echo "*****************************************************"
kubectl --kubeconfig ~/.honeycomb/config get componentstatuses
echo "*****************************************************"
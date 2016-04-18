#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

trap 'exit' ERR

echo "Installing sshpass..."
apt-get install -y -qq sshpass

echo "Installing ansible..."
pip install ansible

echo "Run ansible playbook..."
cd /vagrant/ansible
ansible-playbook swarm.yml -i hosts
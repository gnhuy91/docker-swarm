#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

trap 'exit' ERR

echo "Installing Ansible..."
apt-get install -y -qq --reinstall ca-certificates
apt-get install -y -qq python-pip python-dev libffi-dev libssl-dev sshpass
pip install -q --upgrade setuptools
pip install -q ansible

echo "Run Ansible playbook..."
cd /vagrant/ansible && ansible-playbook swarm.yml -i hosts

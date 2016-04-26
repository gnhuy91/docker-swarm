#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

trap 'exit' ERR

echo "Installing Ansible..."
apt-get update -y -qq
apt-get install -y -qq python-pip python-dev sshpass
pip install -q ansible==2.0.1.0

echo "Run Ansible playbook..."
cd /vagrant/ansible && ansible-playbook swarm.yml -i hosts

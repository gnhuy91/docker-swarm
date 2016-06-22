#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

trap 'exit' ERR

echo "Installing Ansible..."
apt-get install -y -qq --reinstall ca-certificates
apt-get install -y --force-yes -qq software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update -qq
apt-get install -y -qq ansible

echo "Run Ansible playbook..."
cd /vagrant/ansible && ansible-playbook swarm.yml -i hosts

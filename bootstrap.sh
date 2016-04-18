#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

trap 'exit' ERR

echo "Installing PyPI..."
apt-get update -y -qq
apt-get install -y -qq python-pip python-dev
#!/bin/bash
# Install aws-cli

mkdir -p /tmp/aws-cli && cd /tmp/aws-cli
wget https://bootstrap.pypa.io/get-pip.py && sudo python get-pip.py
sudo pip install awscli
cd - && rm -Rf /tmp/aws-cli

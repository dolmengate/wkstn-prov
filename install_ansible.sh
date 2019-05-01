#! /bin/bash

sudo apt-get update
sudo apt-get install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install ansible -y

mkdir /etc/ansible/facts.d/
repo_loc=$(readlink -f "$0")
cp "$repo_loc"/roles/common/files/etc/ansible/facts.d/ /etc/ansible/

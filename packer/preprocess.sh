#!/bin/sh
# ******************************************************
# Google PSO - Sample prep script for Packer + Ansible
# Image Bakery
# Fabian Salamanca <fsalaman@google.com>
# ******************************************************

REPO="<Repo for Ansible playbook>" # Use a git repo for Ansible playbooks
WDIR="/tmp"

sudo dnf -y upgrade
sudo dnf config-manager --enable "rhui-rhel-9-for-x86_64-appstream-rhui-rpms"
sudo dnf -y install git python3-pip ansible-core
FDIR=${WDIR}/demobakery
git clone ${REPO} ${FDIR} # Recommended add SSH keys for Github private repos
cd ${FDIR}
ansible-playbook -i hosts linux.yaml
cd ${WDIR}
rm -rf $}FDIR}
sudo dnf -y remove ansible-core
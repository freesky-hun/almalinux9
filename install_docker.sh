#!/bin/bash

# Check if the script is running with root privileges
if [ "$(id -u)" != "0" ]; then
  echo "This script must be run with root privileges."
  exit 1
fi

dnf remove -y podman buidah
dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
dnf update
dnf install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
systemctl start docker
systemctl enable docker
usermod -aG docker $USER
docker --version
echo -e "\033[0;31mRelogin is required for all settings to take effect!\033[0m"

#!/bin/bash

echo "================================================================================"
echo "Install dependencies"
sudo apt install ca-certificates wget net-tools gnupg -y

echo "================================================================================"
echo "Add OpenVPN repository"
sudo wget -qO - https://as-repository.openvpn.net/as-repo-public.gpg | sudo apt-key add -
sudo echo "deb http://as-repository.openvpn.net/as/debian focal main">/etc/apt/sources.list.d/openvpn-as-repo.list
sudo apt update

echo "================================================================================"
echo "Install OpenVPN"
sudo apt install openvpn-as -y

echo "================================================================================"
echo "Setting up a password for the WebUI"
sudo passwd openvpn
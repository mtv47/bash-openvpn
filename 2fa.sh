#!/bin/bash

echo "================================================================================"
echo "Installing 2FA"
sudo apt install libpam-google-authenticator

echo "================================================================================"
echo "Adding 2FA to SSH"
sudo echo "auth required pam_google_authenticator.so" >> /etc/pam.d/sshd
sudo systemctl restart sshd.service

echo "================================================================================"
echo "Changing ChallengeResponseAuthentication to yes"
sudo sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config
sudo systemctl restart sshd.service

echo "================================================================================"
echo "Configuration of google-authenticator"
google-authenticator

#!/bin/bash

echo "Step 1 $(date +"%T") : Updating System Packages"
sudo apt update && sudo apt upgrade -y

echo "Step 2 $(date +"%T") : Installing Git"
sudo apt install -y git

echo "Step 3 $(date +"%T") : Installing Nginx"
sudo apt install -y nginx

echo "Step 4 $(date +"%T") : Adding Docker Repository and Key"
if ! grep -q "^deb .*https://download.docker.com/linux/ubuntu" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release -y

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
fi

echo "Step 5 $(date +"%T") : Installing Certbot"
sudo apt install -y certbot python3-certbot-nginx

echo "Script execution for one-time setup completed."

#!/bin/bash

echo "Step 1 $(date +"%T") : Updating System Packages"
sudo apt update && sudo apt upgrade -y

echo "Step 2 $(date +"%T") : Installing Git"
sudo apt install -y git

echo "Step 3 $(date +"%T") : Installing Nginx"
sudo apt install -y nginx

echo "Step 4 $(date +"%T") : Installing Docker"
sudo apt update && \
sudo apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io -y

echo "Step 5 $(date +"%T") : Installing Certbot"
sudo apt install -y certbot python3-certbot-nginx

echo "Step 6 $(date +"%T") : Installing Docker Compose"
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo "Step 7 $(date +"%T") : Installing NVM"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Source the NVM environment variables
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

echo "Step 8 $(date +"%T") : Installing Node.js using NVM"
nvm install --lts  # This will install the latest LTS version of Node.js
nvm use --lts

echo "Step 9 $(date +"%T") : Setting Up Docker User Group and User"
sudo groupadd docker
sudo usermod -aG docker $USER

echo "Step 10 $(date +"%T") : Installing Project Specific NPM Packages"
npm install

echo "Script execution completed."

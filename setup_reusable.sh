#!/bin/bash

echo "Step 1 $(date +"%T") : Installing Docker"
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io -y

echo "Step 2 $(date +"%T") : Installing Docker Compose"
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo "Step 3 $(date +"%T") : Installing NVM"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Source the NVM environment variables
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

echo "Step 4 $(date +"%T") : Installing Node.js using NVM"
nvm install --lts
nvm use --lts

echo "Step 5 $(date +"%T") : Setting Up Docker User Group and User"
sudo groupadd docker
sudo usermod -aG docker $USER

echo "Step 6 $(date +"%T") : Installing Project Specific NPM Packages"
npm install

echo "Script execution for reusable setup completed."

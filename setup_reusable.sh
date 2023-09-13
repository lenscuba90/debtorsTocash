#!/bin/bash

if [ "$(whoami)" != "len" ]; then
  echo "This script must be run as user 'len'. Exiting."
  exit 1
fi

function check_docker_installed {
  dpkg -l | grep -q docker-ce
}

function check_docker_compose_installed {
  [ -x /usr/local/bin/docker-compose ]
}

function check_nvm_installed {
  [ -d "$HOME/.nvm" ]
}

echo "Step 1 $(date +"%T") : Checking and Installing Docker"
if check_docker_installed; then
  echo "Docker is already installed."
else
  echo "Docker is not installed. Please run the setup_once.sh script first."
  exit 1
fi

echo "Step 2 $(date +"%T") : Checking and Installing Docker Compose"
if check_docker_compose_installed; then
  echo "Docker Compose is already installed."
else
  curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
fi

echo "Step 3 $(date +"%T") : Checking and Installing NVM"
if check_nvm_installed; then
  echo "NVM is already installed."
else
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

echo "Step 4 $(date +"%T") : Installing Node.js using NVM"
. "$HOME/.nvm/nvm.sh"
LATEST_LTS_VERSION=$(nvm ls-remote --lts | grep 'Latest LTS' | awk '{print $1}')
CURRENT_VERSION=$(nvm ls | grep -oP 'v\d+\.\d+\.\d+' | head -1)
if [ "$CURRENT_VERSION" == "$LATEST_LTS_VERSION" ]; then
  echo "Node.js is already installed and at the latest LTS version ($CURRENT_VERSION)."
else
  nvm install --lts
fi
nvm use --lts

echo "Step 5 $(date +"%T") : Setting Up Docker User Group and User"
if ! getent group docker > /dev/null; then
  sudo groupadd docker
fi
sudo usermod -aG docker $USER

echo "Step 6 $(date +"%T") : Installing Project Specific NPM Packages from package.json"
cd /home/len/debtorsTocash
npm install

echo "Script execution for reusable setup completed."

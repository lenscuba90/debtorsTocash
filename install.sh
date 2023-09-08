 #!/bin/bash

# Step 1: Update & Upgrade System Packages
now=$(date +'%H:%M:%S')
echo -e "\e[1mStep 1 $now : Updating System Packages\e[0m"
sudo apt update -y
sudo apt upgrade -y

# Step 2: Install Git
now=$(date +'%H:%M:%S')
echo -e "\e[1mStep 2 $now : Installing Git\e[0m"
sudo apt install git -y

# Step 3: Install Nginx
now=$(date +'%H:%M:%S')
echo -e "\e[1mStep 3 $now : Installing Nginx\e[0m"
sudo apt install nginx -y

# Step 4: Install Docker
now=$(date +'%H:%M:%S')
echo -e "\e[1mStep 4 $now : Installing Docker\e[0m"
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update -y
sudo apt install docker-ce -y

# Step 5: Install Certbot
now=$(date +'%H:%M:%S')
echo -e "\e[1mStep 5 $now : Installing Certbot\e[0m"
sudo apt install certbot python3-certbot-nginx -y

# Step 6: Install Docker Compose
now=$(date +'%H:%M:%S')
echo -e "\e[1mStep 6 $now : Installing Docker Compose\e[0m"
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Step 7: Install Node.js
now=$(date +'%H:%M:%S')
echo -e "\e[1mStep 7 $now : Installing Node.js\e[0m"
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get update
sudo apt-get install nodejs -y 

# Step 8: Node.js installation includes npm, moving to the next step.
now=$(date +'%H:%M:%S')
echo -e "\e[1mStep 8 $now : Node.js installation includes npm, moving to the next step.\e[0m"

# Step 9: Set Up Docker User Group and User
now=$(date +'%H:%M:%S')
echo -e "\e[1mStep 9 $now : Setting Up Docker User Group and User\e[0m"
sudo groupadd docker
sudo usermod -aG docker $USER

# Step 10: Install NPM Packages
now=$(date +'%H:%M:%S')
echo -e "\e[1mStep 10 $now : Installing Project Specific NPM Packages\e[0m"
cd /home/len/debtorsTocash.com
npm install @apollo/client @apollo/server body-parser concurrently cors express graphql graphql-http mongoose react react-dom react-router-dom typescript

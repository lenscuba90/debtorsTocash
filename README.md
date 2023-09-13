# debtorsTocash Project Setup

## Introduction

This repository contains scripts and files necessary for setting up the debtorsTocash project. The following instructions will guide you through the initial setup process.

## Prerequisites

- A system running Ubuntu, latest LTS, or a similar Linux distribution. (Note: The setup scripts will take care of installing Docker, Docker Compose, and other necessary components.)
- Visual Studio Code (or any other code editor) installed for editing and managing your project files.

## Setup Instructions

### Step 1: Clone the Repository

Clone the repository to your local machine by using the following command in your terminal:

git clone <Repository URL>

css


Navigate to the cloned repository:

cd debtorsTocash

sql


### Step 2: One-Time Setup Script

This script will set up necessary components including Docker, Docker Compose, and Nginx. Execute the script by navigating to your project directory and executing the script:

chmod +x setup_once.sh
./setup_once.sh

bash


### Step 3: Reusable Setup Script

This script installs necessary components and packages and can be run multiple times if needed. Execute the script as follows:

chmod +x setup_reusable.sh
./setup_reusable.sh

vbnet


### Step 4: Installing NPM Packages

If your project requires NPM packages, navigate to the project folder where package.json is located and run:

npm install

markdown


This will install all the necessary NPM packages for your project.

## What the Scripts Do

- `setup_once.sh`:
  - Updates system packages.
  - Installs Git and Nginx.
  - Adds Docker repository and key.
  - Installs Certbot.

- `setup_reusable.sh`:
  - Checks and installs Docker.
  - Checks and installs Docker Compose.
  - Checks and installs NVM and Node.js.
  - Sets up Docker user group and user.
  - Installs project-specific NPM packages from package.json.

## Conclusion

Following these steps will help you set up your debtorsTocash project quickly and efficiently. Remember to replace <Repository URL> with your actual repository URL.

For further assistance or queries, refer to the project documentation or contact the support team.

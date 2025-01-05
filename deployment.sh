#!/bin/bash

# Update package index
sudo apt update

# Install essential tools
sudo apt install -y \
  git \
  ca-certificates \
  curl \
  gnupg \
  lsb-release

# Add Docker's official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --batch --yes --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Set up the Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package index again
sudo apt-get update

# Install Docker packages
sudo apt install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-buildx-plugin \
  docker-compose-plugin

# Create the Docker group if it does not exist
if ! getent group docker > /dev/null; then
  sudo groupadd docker
fi

# Add the current user to the Docker group
sudo usermod -aG docker $USER

# Create the pgdata directory if it does not exist
mkdir -p pgdata

# Start the Docker Compose setup
docker compose up -d

# Final message
echo "The CMS is now up and running, you can check it at https://localhost:443"

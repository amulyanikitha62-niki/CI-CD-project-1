#!/bin/bash
sudo apt-get update -y
sudo apt-get install docker.io -y
sudo usermod -aG docker ubuntu
sudo usermod -aG docker jenkins
newgrp docker
sudo chmod 600 /var/run/docker.sock
sudo chmod root:docker /var/run/docker.sock
sudo systemctl restart docker
docker --version

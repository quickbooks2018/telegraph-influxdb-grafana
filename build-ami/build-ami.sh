#!/bin/bash
# Purpose: Docker & Docker Host Monitoring
# OS AmazonLinux
# Maintainer DevOps Muhammad Asim

######################
# Docker Installation
######################

yum update -y
yum install -y docker || amazon-linux-extras install docker -y

yum install -y nc jq tmux
systemctl start docker
systemctl enable docker

#################################
# Docker Compose v1 installation
#################################
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose --version


#################################
# Docker Compose V2 Installation
#################################
#########################################################################################
# 1 Run the following command to download the current stable release of Docker Compose
#########################################################################################

mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.0.1/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose

 ###############################################
 # 2 Apply executable permissions to the binary
 ###############################################

chmod +x ~/.docker/cli-plugins/docker-compose

###############################################
# 3 Apply executable permissions to the binary
###############################################

docker compose version
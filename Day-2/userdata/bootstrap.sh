#!/bin/bash

  # (Install Docker CE)
  ## Set up the repository:
  ### Install packages to allow apt to use a repository over HTTPS
  sudo apt-get update && sudo apt-get install -y \
    apt-transport-https ca-certificates curl software-properties-common gnupg
  # Add Docker's official GPG key:
  sudo install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  sudo chmod a+r /etc/apt/keyrings/docker.gpg

  # set up the repository

  echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  # install the latest version
  sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

  # Set up the Docker daemon
  sudo tee /etc/docker/daemon.json > /dev/null <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF
  sudo mkdir -p /etc/systemd/system/docker.service.d

  # Restart Docker
  sudo systemctl daemon-reload
  sudo systemctl restart docker
  sudo systemctl enable docker

  # Add user to the Docker group 
  sudo usermod -aG docker $USER

  sleep 20

  # install openjdk-11-jre & maven
  sudo apt update
  sudo apt install openjdk-11-jre -y
  sudo apt install maven -y

  ### INSTALL TOMCAT ###
  
  # Change directory to /opt
  cd /opt
  # Download Apache Tomcat
  sudo wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.65/bin/apache-tomcat-9.0.65.tar.gz
  # Extract the downloaded tar file
  sudo tar -xvf apache-tomcat-9.0.65.tar.gz
  
  
  # INSTALL JENKINS 
  sudo apt update -y
  # sudo apt install openjdk-11-jre -y

  curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null
  echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
  sudo apt-get update -y 
  sudo apt-get install jenkins -y

  sudo systemctl enable jenkins
  sudo systemctl start jenkins
  sudo systemctl status jenkins
    
      
  # install jenkins & run on port 8082
  # sudo apt update -y
  # sudo apt install openjdk-11-jre -y
  # sudo wget https://updates.jenkins.io/download/war/2.387.3/jenkins.war
  # https://updates.jenkins.io/download/war/2.409/jenkins.war
  # sudo wget https://get.jenkins.io/war-stable/2.401.1/jenkins.war
  # java -jar Jenkins.war  --httpPort=8082



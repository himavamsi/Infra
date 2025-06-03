#!/bin/bash

sleep 10

sudo apt update

sleep 10

sudo apt install -y openjdk-17-jre

sleep 10

echo "Java installed sucessfully"

sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update

sleep 10

sudo apt install -y jenkins

sleep 10

echo "jenkins installed sucessfully"

sudo apt update

sleep 20

sudo apt install -y software-properties-common gnupg

sleep 20

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update

sleep 10

jenkins --version

echo "jenkins installed sucessfully"

sudo apt install -y terraform

sleep 20


sudo terraform --version

echo "terraform installed sucessfully"

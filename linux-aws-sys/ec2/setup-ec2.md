## Connect to EC2
ssh -i key.pem ubuntu@ec2

# Update / Upgrade
sudo apt update -y
sudo apt upgrade -y

## Install common tools
sudo apt install -y build-essential
sudo apt install -y zlib1g-dev
gcc (C)
java-1.8.0-openjdk

# Git
sudo apt install git -y

# Python
sudo apt install python3 python3-pip -y

# Docker
sudo apt install docker.io -y
sudo systemctl enable docker --now

# Verify version
git --version
python3 --version
docker --version

# Check if service is running
sudo systemctl enable / disable docker
sudo systemctl status docker
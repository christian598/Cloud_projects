#!/bin/bash

# Create group
sudo groupadd bioinformatics

# add user to group
sudo useradd -m -g bioinformatics user

# Create dir
sudo mkdir -p /home/bioinformatics/shared_data

# Give ownersship to bio group
sudo chown -R :bioinformatics /home/bioinformatics/shared_data

# Set permissions for the dir
sudo chmod -R 775 /home/bioinformatics/shared_data
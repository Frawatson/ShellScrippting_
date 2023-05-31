#!/bin/bash

# Create Tom user
sudo adduser Tom

# Create group for yourself and Tom
sudo groupadd mygroup

# Add yourself and Tom to the group
sudo usermod -aG mygroup pope01
sudo usermod -aG mygroup Tom

# Create group for friends
sudo groupadd friends

# Create folders
sudo mkdir /notes
sudo mkdir /research

# Set group ownership and permissions for shared folder
sudo chown root:mygroup /notes
sudo chmod 770 /notes

# Set group ownership and permissions for private folder
sudo chown root:friends /notes
sudo chmod 750 /notes

# Add group write permission to the shared folder
sudo chmod g+w /research

# Add read-only permission for friends on the private folder
sudo chmod g+r /notes

# Set the setgid permission on the shared folder to maintain group ownership
sudo chmod g+s /research
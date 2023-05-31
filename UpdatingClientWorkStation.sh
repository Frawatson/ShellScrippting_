#!/bin/bash

# Check if Python is installed for Jane
if ! command -v python &> /dev/null; then
    # Python is not installed, install python3
    sudo apt-get update
    sudo apt-get install -y python3
elif command -v python2 &> /dev/null; then
    # Python2 is present, remove it and install python3
    sudo apt-get remove -y python2
    sudo apt-get update
    sudo apt-get install -y python3
fi

# Check if MySQL is installed
if ! command -v mysql &> /dev/null; then
    # MySQL is not installed, install it
    sudo apt-get update
    sudo apt-get install -y mysql-server
fi

# Check if sudo access is available or elevate permissions
if [ $(id -u) -ne 0 ]; then
    # Not running with sudo, elevate permissions
    if command -v sudo &> /dev/null; then
        exec sudo bash "$0"
    else
        echo "Please run the script with sudo or as root."
        exit 1
    fi
fi

# Untar java.gz and install it
tar -xzf java.tar.gz
sudo mv java /opt

# Provide executable permission
sudo chmod +x /opt/java/bin/java

# Configure Java to start immediately after boot
sudo update-rc.d java defaults

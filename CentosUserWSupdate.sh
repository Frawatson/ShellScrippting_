#!/bin/bash

# Check if MySQL is installed
if ! command -v mysql &> /dev/null; then
    # MySQL is not installed, install it
    sudo yum update
    sudo yum install mysql-server -y
fi

# Check if Python is present for Tom
if command -v python &> /dev/null; then
    # Python is present, remove it
    sudo yum remove python -y
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

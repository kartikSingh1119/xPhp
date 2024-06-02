#!/bin/bash

# Check if the user has superuser privileges
if [ "$(id -u)" -ne "0" ]; then
    echo "Please run this script as root or using sudo."
    exit 1
fi

# Check if apt or yum is available
if [ -x "$(command -v apt)" ]; then
    # Update package index and install PHP
    apt update
    apt install -y php
elif [ -x "$(command -v yum)" ]; then
    # Install PHP using yum
    yum install -y php
else
    echo "Error: Neither apt nor yum package manager found. Cannot install PHP."
    exit 1
fi

# Check if PHP is installed
if [ -x "$(command -v php)" ]; then
    echo "PHP has been successfully installed."
else
    echo "Error: PHP installation failed."
fi

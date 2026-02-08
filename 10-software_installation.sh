#!/bin/bash

user_id=$UID
if [ $user_id -ne 0 ]; then
    echo "Please run the script as root user"
    exit 1;
fi

echo "disbaling the default version of nodejs ........"
dnf module disable nodejs -y

echo "Enabling the nodejs:20 as default ........."
dnf module enable nodejs:20 -y

echo "Installing the nodejs ........."
dnf install nodejs -y


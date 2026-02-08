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

if [ $? -eq 0 ]; then
    echo "Installing NodeJs ............. SUCCESS"
else
    echo "Installing Nodejs ............. FAILURE"
fi

echo "Installing MySQL .............."
dnf install mysql -y

if [ $? -eq 0 ]; then
    echo "Installing mysql .............. SUCCESS"
else
    echo "Installing mysql .............. FAILURE"
fi

echo "Installing nginx ..........."
dnf install nginx -y 

if [ $? -eq 0 ]; then
    echo "Installing Nginx ............... SUCCESS"
else
    echo "Installing Nginx ............... FAILURE"
fi


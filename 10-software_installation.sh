#!/bin/bash

echo "disbaling the default version of nodejs ........"
dnf module disable nodejs -y

echo "Enabling the nodejs:20 as default ........."
dnf module enable nodejs:20 -y

echo "Installing the nodejs ........."
dnf install nodejs -y


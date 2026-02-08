#!/bin/bash

set -e

N="\e[0m"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
user_id=$UID
log_folder=/var/log/shell
log_file=$log_folder/$0.log

if [ $user_id -ne 0 ]; then
    echo -e "$R Please run the script as root user $N" &>> $log_file
    exit 1;
fi

for package in $@
do
    dnf list installed $package &>> $log_file
    if [ $? -ne 0 ]; then
        echo "########### Installing $package ###########" &>> $log_file
        dnf install $package -y &>> $log_file
        echo -e "$package installing....... $G SUCCESS $N" &>> $log_file
    else
        echo -e "$package already installed....... $Y SKIPPING $N" &>> $log_file
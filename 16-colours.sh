#!/bin/bash

N="\e[0m"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
log_folder=/var/log/shell
log_file=$log_folder/$0.log
user_id=$UID

if [ $user_id -ne 0 ]; then
    echo "$R Please run the script as root user$N"
    exit 1;
fi

mkdir -p $log_folder

validate_installation() {
    if [ $1 -ne 0 ]; then
        echo "Installing $2 is .......... $R FAILURE$N" | tee -a $log_file
        exit 1;
    else
        echo "Installing $2 is ..........$G SUCCESS$N" | tee -a $log_file
    fi
}

for package in $@
do
   dnf list installed $package &>> $log_file
   if [ $? -eq 0 ]; then
        echo "$package already installed ....$Y SKIPPING$N" | tee -a $log_file 
    else 
        echo "############## Installing $package ##############" &>> $log_file
        dnf install $package -y &>> $log_file
        validate_installation $? $package
    fi
done
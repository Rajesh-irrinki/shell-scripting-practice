#!/bin/bash

log_folder=/var/log/shell
log_file=$log_folder/$0.log
user_id=$UID

if [ $user_id -ne 0 ]; then
    echo "Please run the script as root user"
    exit 1;
fi

mkdir -p $log_folder

validate_installation() {
    if [ $1 -ne 0 ]; then
        echo "Installing $2 is .......... FAILURE" | tee -a $log_file
        exit 1;
    else
        echo "Installing $2 is .......... SUCCESS" | tee -a $log_file
    fi
}

for package in $@
do
   dnf list installed $package &>> $log_file
   if [ $? -eq 0 ]; then
        echo "$package already installed .... SKIPPING" &>> $log_file
    else 
        echo "############## Installing $package ##############"
        dnf install $package -y &>> $log_file
        validate_installation $? $package
    fi
done
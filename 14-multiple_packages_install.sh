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
        echo "Installing $2 is .......... FAILURE"
        exit 1;
    else
        echo "Installing $2 is .......... SUCCESS"
    fi
}

for i in $@
do
    echo "############## Installing $1 ##############"
    dnf install $1 -y
    validate_installation $? $1 
done
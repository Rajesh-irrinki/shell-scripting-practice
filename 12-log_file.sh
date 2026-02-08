#!/bin/bash

log_folder=/var/log/shell
log_file=$log_folder/$0.log
user_id=$UID

if [ $user_id -ne 0 ]; then
    echo "Please run the script as root user"
    exit 1;
fi

mkdir -p $log_folder

validate_installation () {
    if [ $1 -eq 0 ]; then
        echo "Installing $2 .......... SUCCESS" | tee -a $log_file
    else
        echo "Installing $2 .......... FAILURE" | tee -a $log_file
        exit 1;
    fi
}

echo "#########################  Installing Nginx #########################"
dnf install nginx -y  &>> $log_file 
validate_installation $? Nginx 

echo "#########################  Installing MySQL #########################"
dnf install mysql -y &>> $log_file
validate_installation $? MySQL 

echo "######################### Installing NodeJs #########################"
dnf install nodejs -y &>> $log_file
validate_installation $? NodeJs 

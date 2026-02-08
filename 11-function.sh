#!/bin/bash

user_id=$UID
if [ $user_id -ne 0 ]; then
    echo "Please run the script as root user"
    exit 1;
fi

validate_installation () {
    if [ $1 -eq 0 ]; then
        echo "Installing $2 .......... SUCCESS"
    else
        echo "Installing $2 .......... FAILURE"
        exit 1;
    fi
}

echo "#########################  Installing Nginx #########################"
dnf install nginx -y
validate_installation $? Nginx

echo "#########################  Installing MySQL #########################"
dnf install mysql -y
validate_installation $? MySQL

echo "######################### Installing NodeJs #########################"
dnf install nodejs -y
validate_installation $? NodeJs

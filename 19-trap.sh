#!/bin/bash

set -e #ERR
trap 'echo "there is an error while executing the script at $LINENO line number and commnd : $BASH_COMMAND"'  ERR

user_id=$UID
log_folder=/var/log/shell/
log_file=$log_folder/$0.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $user_id -ne 0 ] ; then
    echo -e " $R Please run the script with root access $N " | tee -a $log_file
    exit 1;
fi

if [ $# -eq 0 ]; then
    echo -e "$R Please provide required Package name for Installing.... $N " | tee -a $log_file
mkdir -p $log_folder

for package in $@
do
    dnf list installed $package &>> $log_file
    if [ $? -ne 0 ]; then
        echo -e "$package is not installed, ........ $G INSTALLING NOW $N" &>> $log_file
        dnf install $package &>> $log_file &>> $log_file
    else
        echo -e "$package is already installed ......$Y SKIPPING $N " &>> $log_file
    fi
done
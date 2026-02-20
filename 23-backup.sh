#!/bin/bash

user_id=$UID
logs_dir=/var/log/shell/
log_file=$logs_dir/$0.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
source_dir=$1
dest_dir=$2
days=${3:-15}

mkdir -p $logs_dir

if [ $user_id -ne 0 ]; then
    echo -e "$R Please run the script with root access $N" | tee -a $log_file
    exit 1
fi

if [ $# -lt 2 ]; then
    usage
fi

usage() {
    echo -e "$R sudo backup <SOURCE_DIR> <DESTINATION_DIR> <DAYS> deafualt:15 days $N" | tee -a $log_file
    exit 1
}

if [ ! -d $source_dir ]; then
    echo -e "$source_dir $ doesn't exists $N" | tee -a $log_file
    exit 1
fi



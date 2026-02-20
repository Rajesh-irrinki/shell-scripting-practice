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
days=${3:-15} # provide the how many days old files are need to archieve
print_date=$(date +'%F %T')

mkdir -p $logs_dir

if [ $user_id -ne 0 ]; then
    echo -e "[ $print_date ]$R Please run the script with root access $N" | tee -a $log_file
    exit 1
fi

print_usage() {
    echo -e "[ $print_date ]$R sudo backup <SOURCE_DIR> <DESTINATION_DIR> <DAYS> deafualt:15 days $N" | tee -a $log_file
    exit 1
}

if [ $# -lt 2 ]; then
    print_usage
fi

if [ ! -d $source_dir ]; then
    echo -e "[ $print_date ] $source_dir $R doesn't exists $N" | tee -a $log_file
    exit 1
fi

if [ ! -d $dest_dir ]; then
    echo -e "[ $print_date ] $dest_dir $R doesn't exists $N" | tee -a $log_file
    exit 1
fi

files=$(find "$source_dir" -name "*.log" -type f -mtime +$days)
echo "[ $print_date ] Archive process started...." | tee -a $log_file
echo "[ $print_date ] Source directory : $source_dir" | tee -a $log_file
echo "[ $print_date ] Destination directory : $dest_dir" | tee -a $log_file
echo "[ $print_date ] Days: $days" | tee -a $log_file

if [ -z "$files" ]; then
    echo -e "[ $print_date ] No files to archieve ... $Y SKIPPING $N" | tee -a $log_file
    exit 1 
else
    echo "[ $print_date ] Log files found in $source_dir : $files" | tee -a $log_file
    timestamp=$(date +'%F-%H-%M-%S')
    zip_file_name="$dest_dir/app-logs-$timestamp.tar.gz"
    echo "[ $print_date ] Archeive name: $zip_file_name" | tee -a $log_file
    tar -cvzf $zip_file_name $files

    if [ -f $zip_file_name ]; then
        echo -e "[ $print_date ] Archieving is$G success $N" | tee -a $log_file
        exit 1
    else
        echo -e "[ $print_date ] Archieving is$R FAILED $N"  | tee -a $log_file
        exit 1
    fi
fi


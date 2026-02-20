#!/bin/bash

logs_dir=/var/logs/shell
log_file=$logs_dir/logs-deletion.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
source_dir=$1
dest_dir=$2
$days=${3:-14}
print_date=$(date +'%F %T')

mkdir -p $logs_dir

if [ $UID -ne 0 ]; then
    echo -e "[ $print_date ]$R Please run the script with the root access $N" | tee -a $log_file
    exit 1
fi

print_usage() {
    echo -e "$R sudo backup <SOURCE_DIR> <DESTINATION_DIR> <DAYS> default:15 days $N" | tee -a $log_file
    exit 1
}

if [ $# -lt 2 ]; then
    print_usage
fi

if [ ! -d $source_dir ]; then
    echo -e "[ $print_date ]$R $source_dir doesn't exists" | tee -a $log_file
    exit 1;
fi

if [ ! -d $dest_dir ]; then
    echo -e "[ $print_date ]$R $dest_dir doesn't exists" | tee -a $log_file
    exit 1
fi

files=$(find $source -name "*.log" -type f -mtime +$days)
echo "[ $print_date ] Archieve process started...." | tee -a $log_file
echo "[ $print_date ] Source directory : $source_dir" | tee -a $log_file
echo "[ $print_date ] Destination directory : $dest_dir" | tee -a $log_file
echo "[ $print_date ] Days : $days" | tee -a $log_file

if [ -z $files ]; then
    echo -e "[ $print_date ] No files found for archiveing ... $Y SKIPPING $N" | tee -a $log_file
    exit 1
else
    timestamp=$(date +'%F-%H-%M-%S')
    echo "[ $print_date ] Files found at $source_dir : $files" | tee -a $log_file
    zip_file_name=$dest_dir/app-logs-$timestamp.log
    tar -cvzf "$zip_file_name" "$files" &>>$log_file

    if [ -f $zip_file_name ]; then
        echo -e "[ $print_date ] Archeival process ... $G SUCCESS $N" | tee -a $log_file
        while IFS= read -r filepath;
        do
            echo "[ $print_date ] Removing the $filepath file..." | tee -a $log_file
            rm -f $filepath &>>$log_file
            echo "[ $print_date ] Removed the $filepath file" | tee -a $log_file
        done <<< $files
    else
        echo -e "[ $print_date ] Archeival process ... $R FAILED $N" | tee -a $log_file
        exit 1
    fi
fi 
    

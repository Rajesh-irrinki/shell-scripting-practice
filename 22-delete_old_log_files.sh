#!/bin/bash

logs_dir=/var/logs/app
log_file=$log_folder/$0.sh
user_id=$UID

if [ $user_id -ne 0 ]; then
    echo "Please run the script with root access" | tee -a $log_file
    exit 1
fi

if [ ! -d $logs_dir ]; then
    echo "$logs_dir doesn't exists" | tee -a $log_file
    exit 1;
fi

files_to_delete=$(find $logs_dir -name "*.log" -mtime +15)

if [ -z "$files_to_delete" ] ; then
    echo "No files older than 14 days to delete." | tee -a $log_file
else
    while IFS= read -r file_path; do
        echo "deleting the file: $file_path" | tee -a $log_file
        rm -f $file_path | tee -a $log_file
        echo "deleted file: $file_path" | tee -a $log_file
    done <<< $file_to_delete
fi
#!/bin/bash

Message=""
threshold="20"

disk_usage=$(df -hT | grep -v Filesystem)

while IFS= read -r line
do
    if [ $usage -ge $threshold ]; then
        usage=$($line | awk '{print $6}' | cut -d "%" -f1)
        partition=$($line | awk '{print $7}')
        Message+="High disk usage on $partition : $usage"
    fi 
done <<< $disk_usage

echo "$Message"
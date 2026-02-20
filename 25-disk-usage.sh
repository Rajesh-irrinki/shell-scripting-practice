#!/bin/bash

Message=""
usage_threshold="20"

disk_usage=$(df -hT | grep -v Filesystem)

while IFS= read -r line
do
    usage=$($line | awk '{print $6}' | cut -d "%" -f1)
    partition=$($line | awk '{print $7}')
    if [ "$usage" -ge "$usage_threshold" ]; then
        Message+="High disk usage on $partition : $usage"
    fi 
done <<< $disk_usage

echo "$Message"
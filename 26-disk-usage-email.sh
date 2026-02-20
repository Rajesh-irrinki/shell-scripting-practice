#!/bin/bash

Message=""
IP_ADDRESS=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
usage_threshold="20"

disk_usage=$(df -hT | grep -v Filesystem)

while IFS= read -r line
do
    usage=$(echo $line | awk '{print $6}' | cut -d '%' -f1 )
    partition=$(echo $line | awk '{print $7}')
    if [ $usage -ge $usage_threshold ]; then
        Message+="High disk usage on $partition : $usage <br>"
    fi
done <<< $disk_usage

echo -e "$Message"

sh 26-mail.sh "rajeshirrinki321@gmai.com" "High Disk Usage Alert on $IP_ADDRESS" "$Message" "HIGH_DISK_USAGE" "$IP_ADDRESS" "DevOps Team"
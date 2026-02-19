#!/bin/bash
script_dir=$(cd "$(dirname "$0")" && pwd)
echo " " [ $(date '+%F %T') ] " child script is executing started...."
for i in 5 ; 
do 
    echo "" [ $(date '+%F %T') ] " Count: $1"
    sleep 10;
done 
echo " " [ $(date '+%F %T') ] " child script execution completed"



#!/bin/bash
script_dir=$(cd "$(dirname "$0")" && pwd)
echo " " [ $(date '+%F %T') ] " child script is executing started...."
for i in {1..5} 
do 
    echo " " [ $(date '+%F %T') ] " Count: $i"
done 
echo " " [ $(date '+%F %T') ] " child script execution completed"



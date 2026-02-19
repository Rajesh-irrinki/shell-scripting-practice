#!/bin/bash

echo " " [ $(date '+%F %T') ] " Parent scirpt execution started"
start_time=$(date +%s)
cd $script_dir # variable not present in parent script
echo " " [ $(date '+%F %T') ] " $pwd"
echo " " [ $(date '+%F %T') ] " Parent script is calling child script.."
source ./21-child-script.sh
cd $script_dir # variable will be sourced from child script
echo " " [ $(date '+%F %T') ] " $pwd"
end_time=$(date +%s)
echo " Script exectuion time : $(($end_time - $start_time)) "

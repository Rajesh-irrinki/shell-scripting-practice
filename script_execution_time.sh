#!/bin/bash

start_time=$(date +%s)
echo "Script is running......"
sleep 30
end_time=$(date +%s)
total_time=$(($end_time - $start_time))
echo "Total script execution time: $total_time seconds"


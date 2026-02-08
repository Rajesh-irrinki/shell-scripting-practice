#!/bin/bash

echo "User logged in as $USER"
echo "$USER home directory: $HOME"
echo "Current directory $USER is working : $PWD"
echo "previously $USER worked in $OLDPWD"
echo "Default shell using : $SHELL"
echo "Hostname of current device: $HOSTNAME"
echo "USER ID of $USER : $UID"
echo "generate a random : $RANDOM"
echo "current shell PID : $$"
echo "status of last command execution: $?"
sleep 10 & ## this process will execute in the background
echo "PID of last executed background process: $!"
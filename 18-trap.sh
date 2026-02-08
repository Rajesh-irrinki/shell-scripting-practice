#!/bin/bash

set -e #ERR

trap 'echo "There is an error at $LINENO, command: $BASH_COMMAND"' 

echo "Hello World!!"
echo "I am learning shell scripting"
echoo "this line have error"
echo "No error in this"

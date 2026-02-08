#!/bin/bash

num=$1

# -eq or == means equal 
# -lt or < means less than
# -gt or > means greater than
# -ne or != means not equal

# ------- If-Else condition ---------

if [ $num -ge 0 ]; then
    echo "$num is a Whole Number"
else 
    echo "$num is a Negative Integer number"
fi 

# -------- Else-if condition -----------

if (( $num > 0 )); then
    echo "$num is a Postive number" 
elif (( $num < 0 )); then
    echo  "$num is a negative number"
else
    echo "$num is a neutral number"
fi
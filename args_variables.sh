#!/bin/bash

PERSON1=$1
PERSON2=$2

echo "$PERSON1: Hi $PERSON2, How are you ?"
echo "$PERSON2: Hi $PERSON1!, I am fine, how are you doing man ??"
echo "$PERSON1: yeah, I'm doing great."
echo "$PERSON2: Now tell me, what are you learning these days for Upskilling?"
echo "$PERSON1: I am currently brushing up on my DevOps skills"

echo "File Name: $0" #prints the file name
echo "Arguments are : $@"
echo "toatl arguments: $# "  
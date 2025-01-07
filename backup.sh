#!/bin/bash

DISK_INFO=$(df -hT| grep xfs)
DISK_THROSOLD=5
MSG=""

while read 

while read -r line;
do
    echo $line
done < "$DISK_INFO"
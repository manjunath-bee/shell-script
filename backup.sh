#!/bin/bash

DISK_INFO=$(df -hT| grep xfs)
DISK_THROSOLD=5
MSG=""

while read -r line;
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    PARTHITION=$(echo $line | awk -F " " '{print $NF}')
    echo $PARTHITION
done <<< $DISK_INFO
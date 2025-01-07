#!/bin/bash

DISK_INFO=$(df -hT| grep xfs)
DISK_THROSOLD=30
MSG=""

while read -r line;
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    PARTHITION=$(echo $line | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THROSOLD ] 
    then 
     MSG+="HIGH disk utilzation: $PARTHITION : $USAGE"
     echo $MSG
     echo "$MSG" | mutt -s "High Disk Usage" manjudba2020@gmail.com
    fi
done <<< $DISK_INFO
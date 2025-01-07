#!/bin/bash

DISK_INFO=$(df -hT| grep xfs)
DISK_THROSOLD=5
MSG=""

while read -r line;
do
    USAGE=$(echo $line | aws -F " " '{print $6F}')
done <<< $DISK_INFO
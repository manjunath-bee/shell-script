#!/bin/bash

NUMBER1=$1
NUMBER2=$2

SUM=$(($NUMBER1+$NUMBER2))
TIMESTAMP=$(date)

echo "Curent time $TIMESTAMP sum of $NUMBER1 and $NUMBER2:$SUM"
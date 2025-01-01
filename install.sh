#!/bin/bash

USERID=$(id -u)
if [ $USERID -eq 0 ] 
then
dnf install mysql-server -y
else 
 echo "User dont have sufficient privilage"
 exit 1
 fi
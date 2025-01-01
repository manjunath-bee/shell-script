#!/bin/bash

USERID=$(id -u)
if [ $USERID -eq 0 ] 
then
if [ -f /etc/init.d/mysql* ]
then
echo "mysql already installed"
else 
dnf install mysql-server -y
fi
else 
 echo "User dont have sufficient privilage"
 exit 1
 fi
#!/bin/bash

USERID=$(id -u)
if [ $USERID -eq 0 ] 
then
ARR=$(dnf list installed | grep mysql)
BBB=$?
echo "print $ARR"
if [ $BBB -eq 0 ]
then
echo "mysql already installed"
else 
dnf install mysql-server -y
fi
else 
 echo "User dont have sufficient privilage"
 exit 1
 fi
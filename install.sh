#!/bin/bash

USERID=$(id -u)
if [ $USERID -eq 0 ] 
then
dnf list installed | grep mysql

if [ $? -eq 0 ]; then

    echo "Already installed"
else 

    dnf install mysql-serve -y

    if [ $? -eq 0 ]; then

    echo "installed success"
else 
    echo "not successful"
    exit 1
fi
fi
else 
 echo "User dont have sufficient privilage"
 exit 1
 fi
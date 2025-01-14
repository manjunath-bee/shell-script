#!/bin/bash

USERID=$(id -u)


VALIDATE(){
    if [ $1 -eq 0 ]
then 
echo "$2..succussful"
else 
echo "$2 Failed"
exist 1
fi
}

if [ $USERID -ne 0 ]
then 

echo " User not having sufficent permissions"
exist 1
else
 dnf list installed |grep mysql

 if [ $? -eq 0 ]
then 
echo " Already Installed MYSQL"
else
dnf install mysql-server -y
VALIDATE $? "mysql"
fi
fi



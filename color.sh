#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[31m"

VALIDATE(){
    if [ $1 -eq 0 ]
then 
echo -e "$G $2..succussful"
else 
echo -e "$R $2 Failed"
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
echo -e "$G Already Installed MYSQL"
else
dnf install mysql-server -y
VALIDATE $? "mysql"
fi
fi



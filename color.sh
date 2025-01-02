#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
PATH="/var/log/shell-script"
FILE="log.txt"
FULLPATH="$PATH/$FILE"
VALIDATE(){
    if [ $1 -eq 0 ]
then 
echo -e "$G $2..succussful"&>$FULLPATH
else 
echo -e "$R $2 Failed"&>$FULLPATH
exist 1
fi
}

if [ $USERID -ne 0 ]
then 

echo " User not having sufficent permissions"&>$FULLPATH
exist 1
else
 dnf list installed |grep mysql

 if [ $? -eq 0 ]
then 
echo -e "$G Already Installed MYSQL"&>$FULLPATH
else
dnf install mysql-server -y
VALIDATE $? "mysql"
fi
fi



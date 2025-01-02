#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [$1 -eq 0]
then 
echo "succussful"
else 
echo "failed"
exist 1
fi
}

if [ $USERID -ne 0]
then 

echo " User not having sufficent permissions"
exist 1
else
 dnf list installed mysql
 IF [$? -eq 0]
then 
echo " Installed MYSQL"
else
dnf install mysql -y
VALIDATE $?
fi
fi



#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"

PATH1="/var/log/shell-script"
FILE1="log.txt"
FULLPATH="$PATH1/$FILE1"

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
for PROGRAM in $@
do
 dnf list installed |grep $PROGRAM

 if [ $? -eq 0 ]
then 
echo -e "$G Already Installed $PROGRAM" >>$FULLPATH
else
dnf install $PROGRAM -y 

VALIDATE $? "$PROGRAM" >>$FULLPATH

fi
done
fi


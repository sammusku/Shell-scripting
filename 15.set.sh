#!/bin/bash

#====improving the visbility and readability for user using colors"

set -e  #it will just exit when it finds the error

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"
R="\e[31m"
G="\e[32m"
B="\e[34m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
 echo -e "$R please use root user to access $N" |tee -a $LOGS_FILE
 exit 1
fi
VALIDATE(){
 if [ $1 -ne 0 ]; then
  echo -e "$R $2-----failure $N" |tee -a $LOGS_FILE
  exit 1
 else
  echo -e "$G $2------success $N"
 fi
}

for package in $@  #sudo sh 13.loops.sh nginx mysql nodejs...etc

do 

  dnf list installed $package -y &>> $LOGS_FILE
if [ $? -ne 0 ]; then
  echo -e "$package not installed,$Y installing now $N"
  dnf install $package -y &>> $LOGS_FILE
  #VALIDATE $? "$package installation"
else
  echo -e "$package already installed,....$B skipping $N"
fi  

done 
#!/bin/bash

#====looping allow us to repeat a command or set of commands for each item in list"

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"

if [ $USERID -ne 0 ]; then
 echo "please use root user to access" |tee -a $LOGS_FILE
 exit 1
fi
VALIDATE(){
 if [ $1 -ne 0 ]; then
  echo "$2-----failure" |tree -a $LOGS_FILE
  exit 1
 else
  echo "$2------success"
 fi
}

for package in $@  #sudo sh 13.loops.sh nginx mysql nodejs...etc

do 

  dnf list installed $package -y &>> $LOGS_FILE
  if [ $? -ne 0 ]; then
  echo "$package not installed,installing now"
  dnf install $package -y &>> $LOGS_FILE
  VALIDATE $? "$package installation"
  else
  echo "$package already installed,....skipping"

done 



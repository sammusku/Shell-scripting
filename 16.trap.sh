#!/bin/bash

#====trap will throw the line no with error and then set -e exit.===

set -e  #Err #it will just exit when it finds the error
trap 'echo "there is an error in $LINENO,command:$BASH_COMMAND"' ERR

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

for package in $@  #sudo sh 13.loops.sh nginx mysql nodejs...etc

do 

  dnf list installed $package -y &>> $LOGS_FILE
if [ $? -ne 0 ]; then
  echo -e "$package not installed,$Y installing now $N"
  dnf install $package -y &>> $LOGS_FILE
else
  echo -e "$package already installed,....$B skipping $N"
fi  

done 
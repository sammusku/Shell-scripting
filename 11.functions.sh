#!/bin/bash

#===Functions are intended to complete specific task,it takes input and does the job.
#repeated code we can keep in function() and call it whenever we need.

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
  echo "please use root user for access"
exit 1
  fi

VALIDATE(){
if [ $1 -ne 0 ]; then
  echo "nginx installation.....failure"
else
  echo "nginx installation......success"
fi 

}

dnf install nginx -y
VALIDATE $? "installing nginx"

dnf install mysql -y
VALIDATE $? "installing mysql"

dnf install nodejs -y
VALIDATE $? "installing nodejs"

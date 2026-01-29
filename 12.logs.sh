#!bin/bash
#===Creating logs file for packages and status"

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"

if [ $USERID -ne 0 ]; then
  echo "please use root user for access"
exit 1
fi

VALIDATE(){
if [ $1 -ne 0 ]; then
  echo "$2 .....failure"
else
  echo "$2 ......success"
fi 

 }

dnf install nginx -y &>> $LOGS_FILE
VALIDATE $? "installing nginx"

dnf install mysql -y &>> $LOGS_FILE
VALIDATE $? "installing mysql"

dnf install nodejs -y &>> $LOG_FILE
VALIDATE $? "installing nodejs"


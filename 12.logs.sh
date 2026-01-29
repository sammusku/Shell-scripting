#!bin/bash
#===Creating logs file for packages and status"

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"

if [ $USERID -ne 0 ]; then
  echo "please use root user for access" |tee -a $LOGS_FILE
exit 1
fi

VALIDATE(){
if [ $1 -ne 0 ]; then
  echo "$2 .....failure" |tee -a $LOGS_FILE
else
  echo "$2 ......success" |tee -a $LOGS_FILE
fi 

 }

dnf install nginx -y &>> $LOGS_FILE
VALIDATE $? "installing nginx"

dnf install mysql -y &>> $LOGS_FILE
VALIDATE $? "installing mysql"

dnf install nodejs -y &>> $LOGS_FILE
VALIDATE $? "installing nodejs"


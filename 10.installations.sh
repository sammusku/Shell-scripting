#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
echo "please run script for root user"
exit 1
fi

echo "installing nginx"
dnf install nginx -y 

if [ $? -ne 0 ]; then
echo "installing nginx .....failure"
else
echo "installing nginx......success"
fi
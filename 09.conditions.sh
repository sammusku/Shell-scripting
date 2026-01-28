#!/bin/bash

#===syntax with conditions===

NUMBER=$1

if [ $NUMBER -gt 25 ]; then
echo "$NUMBER is greater than 25"

elif [ $NUMBER -lt 25 ]; then
echo "$NUMBER is less than 25"

else
echo "$NUMBER is equal to 25"
fi

USERID=$2

if [ $USERID -eq 0 ] ; then
echo "$USERID is root user"

elif [ $USERID -gt 10 ] ; then 
echo "$USERID is other user"

elif [ $USERID -lt 10 ] ; then
echo "$USERID is ham "

else
echo "none"

fi
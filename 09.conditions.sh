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

USERID=$1

if [ $USERID =! 1 ]; then
echo "$USERID is ec2-user"

elif [ $USERID > 1 ]; then 
echo "$USERIND is other user"

else [ $USERID == 0 ]; then
echo "$USERUID is root user"

fi
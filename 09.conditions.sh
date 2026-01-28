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
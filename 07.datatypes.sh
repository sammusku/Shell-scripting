#!/bin/bash

#===datatypes===

NUM1=10
NUM2=20

SUM=$(($NUM1+$NUM2))

echo "sum of the numbers:$SUM"

SUB=$((NUM2-NUM1))

echo "Substraction of numbers:$SUB"

DIV=$((NUM2/NUM1))

echo "division of number:$DIV"

MUL=$((NUM1*NUM2))
echo "multiplication of 2 numbers:$MUL"

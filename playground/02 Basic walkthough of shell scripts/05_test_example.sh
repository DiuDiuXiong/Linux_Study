#!/bin/bash

X=10
Y=11

if [ $X -gt $Y ]
then
  echo X is larger than Y
elif [ $X -eq $Y ]
then
  echo X is equal to Y
else
  echo X is less than Y
fi


STR1="HI"
STR2="HELLO"

if [ $STR1 \> $STR2 ]
then
  echo $STR1 is larger than $STR2
elif [ $STR1 = $STR2 ]
then
  echo $STR1 is equal to $STR2
else
  echo $STR1 is smaller than $STR2
fi
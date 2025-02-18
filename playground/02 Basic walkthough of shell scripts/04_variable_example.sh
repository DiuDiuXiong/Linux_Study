#!/bin/bash
VAR1=1
VAR2=hi
VAR3="text"
echo ${VAR1}
echo ${VAR2}
echo $VAR3

SERVER_NAME=$(hostname)
echo "The hostname of this machine is ${SERVER_NAME}"
#!/bin/bash

cat /etc/shadow
COMMAND_SUCCESS=$?

if [ $COMMAND_SUCCESS -eq 0 ]
then
  echo "Command succeeded"
  exit 0
else
  echo "Command failed"
  exit 1
fi
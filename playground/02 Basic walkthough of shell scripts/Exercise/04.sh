#!/bin/bash

if [ -e /etc/ssl ]
then
  echo "ssl passwords are enabled"
  if [ -w /etc/ssl ]
  then
    echo "ssl folder able to write to"
  else
    echo "ssl folder unable to write to"
  fi
fi

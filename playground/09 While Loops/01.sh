#!/bin/bash

LINE_NUM=1
read -p "How many lines of /etc/notify.conf would u like to see? " USER_LIKE_NUM

cat /etc/notify.conf | while read LINE
do
  if [ $LINE_NUM -gt $USER_LIKE_NUM ]
  then
    break
  fi
  echo "${LINE_NUM}: ${LINE}"
  ((LINE_NUM++))
done
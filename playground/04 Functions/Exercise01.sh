#!/bin/bash

function file_count() {
   local NUMBER_OF_FILES=$(ls | wc -l)
   echo "$NUMBER_OF_FILES"
}

file_count

function file_count2() {
  if [ -d $1 ]
  then
    local FILE_COUNT=$(ls $1 | wc -l)
    echo "There are $FILE_COUNT number of files under $1."
    return 0
  else
    echo "$1 not a directory"
    return 1
  fi
}

file_count2 /tmp
file_count2 /bin
file_count2 02.sh
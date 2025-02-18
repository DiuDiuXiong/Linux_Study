#!/bin/bash


for DIR in "$@"
do
  echo "Analysing path ${DIR}"
  if [ -f "$DIR" ]
  then
    echo "This is a file not a directory"
  elif [ -d "$DIR" ]
  then
    echo "This is a directory, print files under it now"
    for file in "${DIR}"/*;
    do
      echo "$file is under ${DIR}"
    done
  fi
done
#!/bin/bash

echo "The first argument is $0"

for arg in "$@"
do
  echo Got an argument $arg
done
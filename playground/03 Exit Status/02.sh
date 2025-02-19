#!/bin/bash

INPUT_FILE="$1"

if [ -f "$INPUT_FILE" ]
then
  exit 0
elif [ -d "$INPUT_FILE" ]
then
  exit 1
else
  exit 2
fi
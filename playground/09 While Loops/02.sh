#!/bin/bash

function show_options() {
  echo "1. Show disk usage."
  echo "2. Show system uptime."
  echo "3. Show the users logged into the system."
  read -p "What would you ilke to do? (Enter q to quit.)" OPTION
}

echo "Welcome to Wuji's system monitor."

while true
do
  show_options
  case $OPTION in
    1)
      df
      ;;
    2)
      uptime
      ;;
    3)
      who
      ;;
    q)
      break
      ;;
    *)
      echo "$OPTION not supported"
      ;;
  esac
done
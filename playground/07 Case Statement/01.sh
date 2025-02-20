#!/bin/bash

echo "Simple calculator, calculate x [+|-|*|/] y"
read -p "Give value for x: " X
read -p "Give value for y: " Y
read -p "Give the operator in one of: +, -, *, /: " operator

calculate() {
  # X, Y, operator, type
  RESULT=0
  case "$4" in
    "int")
      case "$3" in
        "+")
          RESULT=$((X+Y))
          ;;
        "-")
          RESULT=$((X-Y))
          ;;
        "\*")
          RESULT=$((X*Y));
          ;;
        "/")
          RESULT=$((X/Y))
          ;;
        *)
          echo "Operator $3 not supported."
          return 0
          ;;
      esac
      ;;
    "float")
      case "$3" in
        "+")
          RESULT=$(echo "${X}+${Y}" | bc)
          ;;
        "-")
          RESULT=$(echo "${X}-${Y}" | bc)
          ;;
        "*")
          RESULT=$(echo "${X}*${Y}" | bc);
          ;;
        "/")
          RESULT=$(echo "${X}/${Y}" | bc)
          ;;
        *)
          echo "Operator $3 not supported."
          return 0
          ;;
      esac
      ;;
    "*")
      echo "Numeric type not supported."
      return 0
      ;;
  esac
  return 0
}

if [[ "$X" =~ [0-9]+\.[0-9]+ ]] || [[ "$Y" =~ [0-9]+\.[0-9]+ ]]
then
  TYPE="float"
else
  TYPE="int"
fi

calculate $X $Y $operator $TYPE
[[ "$?" == "0" ]] && echo "Result is: $RESULT"
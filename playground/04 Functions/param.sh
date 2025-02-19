#!/bin/bash
my_function() {
  echo "Function name: $0"
  echo "First parameter: $1"
  echo "Second parameter: $2"
  echo "All parameters: $@"
  echo "All parameters (individually):"
  for param in "$@";
  do
    echo "$param"
  done
  echo "Number of parameters: $#"
}

my_function "one" "two" "three"
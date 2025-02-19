#!/bin/bash
global_var="I am global"

my_function2() {
  local local_var="I am local"  # Explicitly declare local variable
  global_var="Global changed by function"  # Modifying global var
  echo "Inside function: global_var = $global_var"
  echo "Inside function: local_var = $local_var"
}

echo "Before function: global_var = $global_var"
my_function2
echo "After function: global_var = $global_var"
echo "After function: local_var = $local_var" # local_var is NOT available

conflict() {
  local global_var="replace global var"
  echo "Inside function: global_var = $global_var"
}
conflict
echo "After function: global_var = $global_var"
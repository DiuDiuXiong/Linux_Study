# Linux_Study
Holder/notes for linux course at: https://www.udemy.com/course/bash-scripting

## Part 1 Introduction to shell scripts

### Shell, Linux Command, and Interpreter
- **Linux Commands**: These are the core tools you use to interact with the Linux operating system. Commands like ls (list files), cd (change directory), mkdir (make directory), and countless others are your building blocks.
- **Shell**: The shell acts as an intermediary between you and the Linux kernel (the heart of the OS). It takes your commands, interprets them, and then tells the kernel what to do. It's like a translator.  
- **Interpreter**: The shell itself is a type of interpreter. It reads your commands (which are essentially lines of code in a scripting language) and executes them one by one.  


In simpler terms: You type a command into the shell, the shell interprets it, and then the corresponding Linux command is executed.

### Basic Syntax
All linux shell commands can be found under `/bin`

#### 01 Make it executable `chmod 755 <bash file>`
This tells the system that this is an executable/program.

#### 02 Shebang `#!`
This special combination of characters signals to the system that this is a script. Everything follow the shebang should
be an executable, it can be an interpreter or even binary for script language like python. `/bin/bash`, `/bin/csh`, `/bin/ksh`, `/bin/zsh`: These are the paths to different shell interpreters.
- [bash example](./playground/02%20Basic%20walkthough%20of%20shell%20scripts/01_shebang_bash.sh)
- [zsh example](./playground/02%20Basic%20walkthough%20of%20shell%20scripts/02_shebang_zsh.sh)
- [python3 example](./playground/02%20Basic%20walkthough%20of%20shell%20scripts/03_shebang_python) It doesn't necessary need to be .sh for the end

When we execute a shell script, it call shebang as binary, file path as first/only argument. So `$0` would be able to see the executable path.

You maybe able to execute code without an interpreter (it will just use shell), but not recommended.

#### 03 Variables
- `VARIABLE_NAME="VALUE"` Make sure not add any space before or after the equal sign.
- `${VAR_NAME}` or `$VAR_NAME` or (deprecated) `` `varname` ``
- `VAR_NAME=$(function)` to pass function value to variable
- Variable names can contain letters/digits/underscore, not start by number.

#### 04 Tests
- `[ <text expression> ]` this is the condition statement of shell script, need to leave space for both side.
- Check https://www.geeksforgeeks.org/shell-scripting-test-command/ for exact list
- Some common ones are: 
  - `[-e|-d|-f|-s|-r|-w|-x] file/dir`
  - `str1 [=|!=|\>|\<] str2`
  - `[-n|-z] str1`
  - `num1 [-eq|-ne|-gt|-ge|-lt|-le] num2`
  - `condition1 [-a|-o] condition2` and negate `! expression` note there's a space
  - Take [if elif else](./playground/02%20Basic%20walkthough%20of%20shell%20scripts/05_test_example.sh) for example of flow control

#### 05 For loop
```bash
for VARIABLE_NAME in NAME1 NAME2 NAMEX
do
  echo $VARIABLE_NAME
done
```
Something expression can also output stuff in iterable. For example
```bash
echo Priting list of numbers
for i in $(seq 1 10);
do
  echo $i
done

echo Printing list of files
for file in $(ls -l);
do
  echo $file
done
```
- `$(ls *.sh)` for all sh files

#### 06 Positional Parameters
`script.sh param1 param2 param3`
- `$0` = `script.sh`
- `$1` = `param1`
- `$2` = `param2`
- ...

Use this to take params from command line.
Also use `"$@"` for all positional arguments. Note that path files will not be included. [See examples](./playground/02%20Basic%20walkthough%20of%20shell%20scripts/06_params.sh)

#### 07 Standard Input
`read -p "PROMPT" VARIABLE`

[example](./playground/02%20Basic%20walkthough%20of%20shell%20scripts/07_input_read.sh)

## Part 2 Return Codes and Exist Status

Every command returns an exit status, range from 0-255, 0 means success while the rest is some kind of error.

we can use `man <command>` then `/code` to find the documentation of a command for its exit codes.

- `$?` to check exit status of previous command
  - Can do some check like `if [ "$?" -eq "0" ] then ...`
- `&&` is and operator, second command won't run if first one failed
- `||` is or operator, second command will only run if first one failed
- ` ; ` is same as line change in a sh file. Will run regardless of previous commands
- `exit <code>` is like return and will stop running rest of bash file. If no exit defined, exit code is last command executed

```bash
#!/bin/bash

ls /tmp && echo "tmp folder does exist"

ls /tmp || echo "tmp folder does not exist"
```
is same as

```bash
#!/bin/bash
ls tmp

if [ "$1" -eq 0 ]
then
  echo "tmp folder does exist"
else
  echo "tmp folder does not exist"
fi
```
Note the check command within `if` statement won't change `$?`, see `if ... fi` as a complete block.

## Part X Math Calculations
use `$((math expressoin))` for match calculation for integer. Its build into shell.
```bash
#!/bin/bash
x=10
y=5

sum=$((x + y))
difference=$((x - y))
product=$((x * y))
quotient=$((x / y))
remainder=$((x % y))
power=$((x ** y))

echo "Sum: $sum"
echo "Difference: $difference"
echo "Product: $product"
echo "Quotient: $quotient"
echo "Remainder: $remainder"
echo "Power: $power"
```

use `let` is another way, need spaces around the operators.
```bash
#!/bin/bash
x=10
y=5

let "sum=x+y"
let "difference = x - y"
let "product = x * y"
let "quotient = x / y"
let "remainder = x % y"

echo "Sum: $sum"
echo "Difference: $difference"
echo "Product: $product"
echo "Quotient: $quotient"
echo "Remainder: $remainder"
```

use `bc for floating point calculation`
```bash
#!/bin/bash
x=10.5
y=5.2

sum=$(echo "$x + $y" | bc)
difference=$(echo "$x - $y" | bc)
product=$(echo "$x * $y" | bc)
quotient=$(echo "scale=2; $x / $y" | bc) # scale sets the number of decimal places

echo "Sum: $sum"
echo "Difference: $difference"
echo "Product: $product"
echo "Quotient: $quotient"
```

Also can use `awk` for floating point calculation.

## Part 3 Functions
To define, include (), to call, don't include ().
```bash
#!/bin/bash
function greet() {
  echo "Hello, world"
}
greet

greet2() {
  echo "Hello, world"
}
greet2
```

We can have functions within functions
```bash
#!/bin/bash
outer_function() {
  inner_function() {
    echo "This is the inner function."
    inner_var="Inner variable"
  }
  inner_function
  echo "From outer function: $inner_var"
}

outer_function

another_outer() {
    another_inner
}

another_inner() {
    echo "This is another inner function."
}

another_outer
```
Note that params are global by default.

To access params, use `$[x|@]`, note that `$0` is still script name, not function name. To call and pass arg, use `function_name arg1 arg2 ...`
```bash
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
```

Variables are global by default, and if it is defined within functions, as long as we call it once, it will be accessible from remote.
To make variables local, use keyword `local`. If local and global conflict, local will replace global within scope of function only. [Example](playground/04%20Functions/variable_scope.sh)

Here's a more complex example:
```bash
#!/bin/bash
backup_file() {
  if [ ! -f "$1" ]; then
    echo "Error: $1 is not a file."
    return 1
  fi

  filename=$(basename "$1")
  timestamp=$(date +%Y%m%d%H%M%S)
  pid=$$
  backup_filename="$filename.$timestamp.$pid"

  cp "$1" "$backup_filename"

  if [ $? -eq 0 ]; then
    echo "File '$1' backed up as '$backup_filename'."
    return 0
  else
    echo "Error during backup."
    return 1
  fi
}

# Example usage:
backup_file "my_document.txt"
backup_file "not_a_file"
```
Note that:
- use `return` to return status code, need to range between  0-255
- `$$` get the PID to ensure uniqueness
- basename to get the name of the file without any path

## Part 5 Shell scripts checklist and template
1. Start with shebang
2. Start with comments
3. Global Vars
4. Functions
5. Main logic
6. exit return status
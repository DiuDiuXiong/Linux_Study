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
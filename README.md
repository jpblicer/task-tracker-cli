# Task Management CLI Tool

## About
Simple task management script I wrote for myself with ruby.
Allows you to create a json file in the local folder to easily add and track tasks through to completition.

## Installation
1. Ensure you have ruby installed on your local machine
2. Clone the repository
3. in `usr/local/bin/` create a file with the alias you want to give the command. I.E. `usr/local/bin/tskmngr`
4. inside of that file add the following
```bash
#!/bin/bash
ruby /path/to/your/main.rb
```
5. you will need to ensure the script is executable using a toold like chmod
`sudo chmod +x taskmngr`

## Usage
Simply call the program and provide it one of the arguements.
Arguements can be found with the -h flag

Short list is also here:
```
    -a DESCRIPTION                   Add Task
    -r ID                            Remove Task
    -l                               List All Tasks
    -i                               List All Tasks Marked "IN-PROGRESS"
    -n                               List Incomplete Tasks
    -p ID                            Mark Task as "IN-PROGRESS"
    -d ID                            Mark Task as "DONE"
```

*Note*: If there is no JSON file in the current directory it will create one to store your tasks.

**Tip**: You can pipe the output into other programs. For example you run `GREP` on the output. 

#!/bin/bash

#===special variables===
echo "View all variables passed to script:$@"
echo "no.of variables passed to script:$#"
echo "script name:$0"
echo "present working directory:$pwd"
echo "who is working currently:$USER"
sleep 10 
echo "PID of the executed recent script:$$"
sleep 10 &
echo "last command executed in background process ID:$!"
echo "executed code status :$?"
echo "view all variables passed to script:$*"
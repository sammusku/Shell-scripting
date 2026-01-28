#!/bin/bash

#===special variables===
echo "View ll variables passed to script:$@"
echo "no.of variables passed to script:$#"
echo "script name:$0"
echo "present working directory:$pwd"
echo "who is working currently:$user"
sleep 10 &
echo "PID of the executed script:$$"
echo "background process ID:$!"
echo "previous existing code status :$?"
echo "view all variables passed to script:$*"
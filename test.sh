#!/usr/bin/env bash

. functions.sh

#TEST 01 BASIC LOGGING

DEBUG=0

log FUNCTIONNAME ERROR "ERROR MESSAGE like this example."


echo ""
echo "Display an OK status...."
display_status OK
echo "Display an ERROR status...." 
display_status ERROR

echo "Check the exit status of a command that failes...."
ls blabla >> /dev/null 2>&1
check_status $?
echo "Lets see if $0 exists...."
ls $0 >> /dev/null 2>&1
check_status $?

echo "Let's invoke a warning..."
display_status WARNING
echo "Let's invoke a NOTICE..."
display_status NOTICE

echo "Using the exec_cmd function to execute a command...."
exec_cmd "ls -al"
echo "Using the exec_cmd function to execute a command that failes...."
exec_cmd "ls -al doesnotexist"

echo ""




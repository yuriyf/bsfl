#!/bin/bash
#
# Bash Shell Function Library
# Written by Louwrentius.
#

BSFL_VERSION=1.01

DEBUG=0

# Logging.
LOGDATEFORMAT="%b %e %H:%M:%S"
LOGFILE=log.txt

# Use colours in output.
RED="tput setaf 1"
GREEN="tput setaf 2"
YELLOW="tput setaf 3"
BLUE="tput setaf 4"
BOLD="tput bold"
DEFAULT="tput sgr0"

function log () {


    NAME="$1"   # Name of the application or function. 
    TYPE="$2"   # FATAL ERROR WARNING NOTICE DEBUG.
    MSG="$3"    # The actual log message. 

    DATE=`date +"$LOGDATEFORMAT"`

    LOGMESSAGE="$DATE - $NAME [$TYPE]: $MSG"
    echo "$LOGMESSAGE" >> $LOGFILE

    if [ "$DEBUG" == "1" ]
    then
        echo "$LOGMESSAGE"
    fi
}

function display_status () {


    function position_cursor () {

        let RES_COL=`tput cols`-12
        tput cuf $RES_COL
        tput cuu1
    }

    STATUS="$1"

    case $STATUS in 

    OK | ok ) 
            STATUS="   OK   "  
            STATUS_COLOUR="$GREEN"
            ;;
    PASSED | passed ) 
            STATUS=" PASSED "  
            STATUS_COLOUR="$GREEN"
            ;;
    
    FAILED | failed | ERROR | error)
            STATUS=" FAILED "  
            STATUS_COLOUR="$RED"
            ;;
    INFO | info | NOTICE | notice)
            STATUS="  INFO  "  
            STATUS_COLOUR="$BLUE"
            ;;
    WARNING | warning)
            STATUS="  WARN  "  
            STATUS_COLOUR="$YELLOW"
            ;;
    esac

    position_cursor
    echo -n "["
    $DEFAULT
    $BOLD
    $STATUS_COLOUR
    echo -n "$STATUS"
    $DEFAULT
    echo "]"
 
}

function check_status () {

    ERROR="$1"
    if [ "$ERROR" == "0" ]
    then
        display_status OK
        return 0
    else
        display_status ERROR
        return 1
    fi
}

function exec_cmd () {

    CMD="$1"

    RESULT=$($CMD 2>&1 )
    check_status $?
    ERROR=$?

    if [ "$ERROR" == "0" ]
    then
        if [ "$DEBUG" == "1" ]
        then
            MESSAGE="$RESULT"
        else
            MESSAGE="Command executed successfuly."
        fi
         
        TYPE=NOTICE
        log "$CMD" $TYPE "$MESSAGE"
    else
        TYPE=ERROR
        log "$CMD" $TYPE "$RESULT"
    fi


    if [ "$DEBUG" == "1" ] 
    then
        echo "$RESULT"
    fi
}

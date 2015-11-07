# Introduction #

**work in progress - currently being edited**

This wiki page will be updated with information about which functions are provided and how to use them. Please note that this page will reflect the functions provided by BSFL version 2.0 and onward.


# Overview of functions #

## Regular fuctions ##

| **Function** |  **Description** |
|:-------------|:-----------------|
| msg          | Displays a message on the screen and logs it |
| log          | Logs a message to a log file |
| defined      | Tests if a variable is defined |
| has\_value   | Tests if a variable has a value |
| directory\_exists | Tests if a directory exists |
| file\_exists | Tests if a file exists  |
| now          | returns the current time in seconds since epoch. |
| elapsed      | returns the difference between two time stamps in seconds |
| start\_watch | Sets the start time. Usefull for timing scripts |
| stop\_watch  | Returns the time passed in seconds since 'start\_time'. Usefull for timing scripts.|
| str\_replace | Replaces a string with a string with a string |
| str\_replace\_in\_file | Replaces a string within a file |

## Message functions ##

All these functions are shortcuts to display a message with a specific 'status'.

These functions tage one argument, a string between double quotes like:

msg\_ok "This is ok."

```
  msg_emergency 
  msg_alert
  msg_critical
  msg_error
  msg_warning
  msg_notice
  msg_info
  msg_debug
  msg_ok
  msg_not_ok
  msg_fail
  msg_success
  msg_passed
```

![http://louwrentius.com/images/bsfl02.png](http://louwrentius.com/images/bsfl02.png)

# Details #

## Status Codes ##



## Colour Codes ##

### Foreground colours ###

  * BLUE
  * RED
  * YELLOW
  * GREEN
  * CYAN
  * LIGHT\_BLUE (=CYAN)
  * MAGENTA
  * BOLD
  * DEFAULT

### Background colors ###

  * BLUE\_BG
  * RED\_BG
  * YELLOW\_BG
  * GREEN\_BG
  * CYAN\_BG
  * MAGENTA\_BG

## Variables ##

LOG\_FILE  - override this variable in your script to specify your own log file name.
LOG\_ENABLED - enable logging to a file and/or syslog.
SYSLOG\_ENABLED - enables logging to syslog, is independent of logging to a file.

## Functions ##

### msg ###

The function msg displays a message with the desired markup. The function has three arguments:

  1. The message (mandatory)
  1. The colour of the message  (optional)

Example:

```
msg "This is just a test message in green." "$GREEN" 
msg "Another message in red with no status." "$RED"
msg "A message with the default colour." 
msg "A message with a different background" "$BLUE_BG"
msg "A message  in yellow" "$YELLOW"
```

### log ###

This function logs a message (text) to a log file and/or to syslog. The log file is specified with the LOG\_FILE variable.

Usage:

```
log (message)
```


### cmd ###

Description:

This function executes a command and evaluates the exit-status. If an error occurs, this is logged on-screen and to a log file.

Usage:

```
cmd (some command)

e.g.

cmd "ls -al"
```

### defined (variable) ###

This function checks if a variable is set or not. If so, it returns 1, if set, it returns 0. Great for checking command-line arguments.

### has\_value (variable) ###

A variable may be defined but not assigned a value. It is similar to the -z option of an if-statement.

### directory\_exists (directory) ###

Does the specified directory exist?

### file\_exists (file) ###

This function checks if the supplied file actually exists. Returns 0 if the file is found, otherwise, it returns 1.

### now ###

This function returns the time in seconds since epoch.
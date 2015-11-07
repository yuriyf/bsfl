The Bash Shell Function Library (BSFL) is a small Bash script that acts as a library for bash scripts. It provides a couple of functions that makes the lives of most people using shell scripts a bit easier.

BSFL is created because I noticed that I often wrote the same functions from scratch in every new script I wrote. Some of these reoccurring functions are put into BSFL.

BSFL provides some simplified functions for various functions such as tests, logging and presenting information in a nice format. Let's start with an example.

![http://louwrentius.com/images/bsfl01.png](http://louwrentius.com/images/bsfl01.png)

BSFL provides the function 'cmd' that executes a command and displays the exit status of that command. In this example, the cmd function determines to display an 'OK' or 'FAIL' status. But you can display them also directly from your script.

```
msg_emergency "This is an emergency."
msg_alert  "This is an alert."
msg_critical "This is critical."
...
```

![http://louwrentius.com/images/bsfl02.png](http://louwrentius.com/images/bsfl02.png)

This is an example of the output of a real-life script using BSFL.

![http://louwrentius.com/images/bsfl04.png](http://louwrentius.com/images/bsfl04.png)

As you can see, the script is written to be informative for the end-user. BSFL is however also intended for unattended scripts. Such scripts may not need to send output to the screen, but to a log file. BSFL provides a simple means to log messages. BSFL can log messages to a file, syslog or to both. BSFL does nog log to a file or syslog by default.

![http://louwrentius.com/images/bsfl03.png](http://louwrentius.com/images/bsfl03.png)
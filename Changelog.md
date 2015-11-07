# 2.00-beta-3 #

  * Added log_<status type> functions similar to the msg_<status type functions> such as log\_ok, log\_error
  * All information is logged on a single line as [issue 3](https://code.google.com/p/bsfl/issues/detail?id=3) requested. The reported issue was a bug.
  * stop\_watch function returns the elapsed time since start\_watch was issued. The returned string is now just an integer, not with additional text, which is easier for further processing.
  * Some 'private' functions now start with <function name> to distinguish them from public functions.
  * <to be updated>

# 2.00-beta-2 #
  * Added all syslog-style error codes like Emergency, info, warning etc.
  * Imroved positioning of status codes.
  * improved status logging of commands.
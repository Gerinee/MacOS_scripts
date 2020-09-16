#!/bin/bash

# get login username
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser;import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None]) [0];username = [username,""] [username in [u"loginwindow", None, u""]];sys.stdout.write(username+ "\n");'`

# add current user into sudoers group
echo "$loggedInUser          ALL = (ALL) ALL" >> /etc/sudoers

exit 0

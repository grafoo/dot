# ~/.bash_logout: executed by bash(1) when login shell exits.

# clear the screen when leaving the console
# SHLVL is incremented by one each time a new instance of bash is started
# this is intended to be a count of how deeply your bash shells are nested
[ $SHLVL -eq 1 ] && [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q

# NOTES

This is just a place to store my notes as I learn more about UNIX systems.

## Security

1. You should set `HISTFILE` to /dev/null or leave `HISTSIZE` as blank for the root user
   You should also consider empty the .bash_history file when exiting
   To remove saved commands, exit the shell using kill -9 `kill -9 <SHELL_PID>`


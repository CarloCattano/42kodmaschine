########################################
### THIS FILE IS A TEMPLATE FILE     ###
### DO NOT INSTALL AS-IS             ###
### RUN `make profile`               ###
### IT WILL REPLACE THE PLACEHOLDERS ###
########################################

# Check if the terminal is /dev/tty1

if [ "$(tty)" == "/dev/tty1" ]; then
    trap '' SIGQUIT
    trap '' SIGINT
    trap '' SIGTSTP
    echo "Running make user command on /dev/tty1" > /dev/tty1
    cd ${REPO_ROOT}
    #make attachexam
    make restartexam
    #make cheat
    logout
fi

# Check if the terminal is /dev/tty1

if [ "$(tty)" == "/dev/tty1" ]; then
    trap '' SIGQUIT
    trap '' SIGINT
    trap '' SIGTSTP
    echo "Running make user command on /dev/tty1" > /dev/tty1
    cd /home/exam/kodmaschine
    #make attachexam
    make restartexam
    #make cheat
    logout
fi

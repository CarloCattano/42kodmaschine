#!/bin/sh

#cp /orig.c /rendu/challenge1.c

session="kodmaschine"
window="Exam-O-Tron"

subjectpdf="figlet Instructions"
scoreboard="figlet Scoreboard"
challenge1="sleep 0.2; vim challenge1.c"
timer_cmd="sleep 1; /timer 5 42; tmux set -g status-style 'bg=red'"
title="figlet Exam-O-Tron"
prep="unset PS1; stty -echo; clear;"
status="watch -n 1 'cat /result/1 | figlet -t -c'"
# Function to start Vim and Tmux with the specified file
start_vim_and_tmux() {
    tmux new-session -s "${session}" -d -A;
    tmux rename-window -t "${session}" "${window}";
    tmux send "sleep 0.42" C-m;
    tmux splitw -v -l '85%';
    tmux send-keys -t "${session}" "${subjectpdf}" C-m;
    tmux splitw -h -l '75%';
    tmux splitw -h -l '25%';
    tmux send-keys -t "${session}" "${scoreboard}" C-m;
    tmux select-pane -t 0;
    tmux send-keys -t "${session}" "${timer_cmd}" C-m;
    tmux splitw -h -l '75%';
    tmux send-keys -t "${session}" "${title}" C-m;
    tmux splitw -h -l '25%';
    tmux send-keys -t "${session}" "${prep}" C-m "${status}" C-m;
    tmux select-pane -t 4;
    tmux send-keys -t "${session}" "${challenge1}" C-m;
}

# TODO: Fix if sent to background
# Main loop to restart Vim and Tmux if they exit
while true; do
    start_vim_and_tmux
    if [[ $? -ne 0 ]]; then
        echo "Vim or Tmux exited unexpectedly. Restarting..."
    fi
done


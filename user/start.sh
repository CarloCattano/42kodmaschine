#!/bin/sh

#cp /orig.c /rendu/challenge1.c

session="kodmaschine"
window="Exam-O-Tron"

title="watch -t -n 60 'cat /title | /tte binarypath --movement-speed 3'"

scoreboard="cat /result/scoreboard | /tte spotlights"

# TODO: setup progression and run for each challenge individually
examprompt="sleep 0.1; tmux popup -t ${session} -h 70% -w 60% -x 2% -y 28% figlet -t -c 'PRESS BUTTON TO START'"
subjectpdf="cat en.subject1.pdf | /tte print"
challenge1="sleep 0.1; vim challenge1.c +16"

# TODO: Setup a timer instead of countdown
timer_cmd="sleep 0.1; /timer 5 42; tmux set -g status-style 'bg=red'"

#status="watch -t -n 1 'cat /result/1 | figlet -t -c | /tte matrix'"

# Start Vim and Tmux with the specified file
start_vim_and_tmux() {
    tmux new-session -s "${session}" -d -x - -y -
    tmux rename-window -t "${session}" "${window}"
    tmux send "sleep 0.42" C-m
    tmux splitw -v -l '75%'
    tmux splitw -h -l '70%'
    tmux splitw -h -l '50%'
    tmux send-keys -t "${session}" "${scoreboard}" C-m
    tmux select-pane -t 0
    tmux splitw -h -l '80%'
    tmux send-keys -t "${session}" "${title}" C-m
    tmux select-pane -t 0
    tmux send-keys -t "${session}" "${timer_cmd}" C-m
    tmux select-pane -t 2
    tmux select-pane -t 2
    tmux send-keys -t "${session}" "${examprompt}" C-m
    sleep 0.2
    tmux send-keys -t "${session}" "${subjectpdf}" C-m
    sleep 0.2
    tmux select-pane -t 3
    tmux send-keys -t "${session}" "${challenge1}" C-m
    tmux attach -t "${session}"
}

# TODO: Fix if sent to background
# Main loop to restart Vim and Tmux if they exit
while true; do
    start_vim_and_tmux
    if [[ $? -ne 0 ]]; then
        echo "Vim or Tmux exited unexpectedly. Restarting..."
    fi
done


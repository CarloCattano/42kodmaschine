#!/bin/sh

#cp /orig.c /rendu/vimchll.c
# gcc /root/watchcat.c -o /root/watchcat
# chmod +x /root/watchcat

session="kodmaschine"
window="Exam-O-Tron"

title="watch -t -n 60 'cat /title | /tte binarypath --movement-speed 3'"

# scoreboard="watch -t 'cat /result/scoreboard /scoreboard/score.board | /tte spotlights'"
scoreboard="cat /scoreboard/header /scoreboard/score.board | /tte spotlights; /root/watchcat /scoreboard/score.board 'clear; cat /scoreboard/header /scoreboard/score.board | /tte spotlights' 1"

# TODO: setup progression and run for each challenge individually
examprompt="sleep 0.1; tmux popup -t ${session} -h 70% -w 60% -x 2% -y 28% figlet -t -c 'PRESS BUTTON TO START'"
subjectpdf="cat en.subject1.pdf | /tte print"


CLVL=1

if [ -f ../result/1 ]; then
    grep -q "[OK]" ../result/1
    if [ $? -eq 0 ]; then
        CLVL=2
    fi
fi

if [ -f ../result/2 ]; then
    grep -q "[OK]" ../result/2
    if [ $? -eq 0 ]; then
        CLVL=3
    fi
fi

if [ -f ../result/3 ]; then
    grep -q "[OK]" ../result/3
    if [ $? -eq 0 ]; then
        # CLVL=4
        logout
    fi
fi

vimchll="sleep 0.2; vim challenge$CLVL.c"


# TODO: Setup a timer instead of countdown
timer_cmd="sleep 0.1; /timer 5 42; tmux set -g status-style 'bg=red'"

#status="watch -t -n 1 'cat /result/1 | figlet -t -c | /tte matrix'"

# Start Vim and Tmux with the specified file
start_vim_and_tmux() {
    tmux new-session -A -s "${session}" -d -x - -y -
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
    tmux send-keys -t "${session}" "${vimchll}" C-m
}

./scoreboard
# TODO: Fix if sent to background
# Main loop to restart Vim and Tmux if they exit
while true; do
    start_vim_and_tmux
    if [[ $? -ne 0 ]]; then
        echo "Vim or Tmux exited unexpectedly. Restarting..."
    fi
done


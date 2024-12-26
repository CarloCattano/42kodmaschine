#!/bin/sh

session="kodmaschine"
window="Exam-O-Tron"

title="watch -t -n 60 'cat /title | /tte binarypath --movement-speed 3'"

# scoreboard="watch -t 'cat /result/scoreboard /scoreboard/score.board | /tte spotlights'"
scoreboard="clear; cat /result/scoreboard /scoreboard/score.board | /tte spotlights ; /root/watchcat /scoreboard/score.board 'clear; cat /result/scoreboard /scoreboard/score.board | /tte spotlights' 1"

examprompt="sleep 0.1; tmux popup -t ${session}:0 -h 70% -w 60% -x 20% -y 15% figlet -t -c 'PRESS ESC TO START'; exit"
subjectpdf="clear; cat en.subject1.pdf | /tte print"
challenge1="sleep 0.1; vim challenge1.c +16"

timer_cmd="sleep 0.1; /timer 5 42; tmux set -g status-style 'bg=red'"

prep="unset PS1; stty -echo; clear"

#status="watch -t -n 1 'cat /result/1 | figlet -t -c | /tte matrix'"

# Start Vim and Tmux with the specified file
start_vim_and_tmux() {
    tmux new-session -A -s "${session}" -d -x - -y -
    tmux rename-window -t "${session}" "${window}"
    tmux send "sleep 0.42" C-m
    tmux splitw -v -l '75%'
    tmux splitw -h -l '70%'
    tmux splitw -h -l '50%'
    tmux send-keys -t "${session}" "${prep}; ${scoreboard}" C-m
    tmux select-pane -t 0
    tmux splitw -h -l '80%'
    tmux send-keys -t "${session}" "${prep}; ${title}" C-m
    tmux select-pane -t 0
    tmux send-keys -t "${session}" "${prep}; ${timer_cmd}" C-m
    tmux send-keys -t "${session}" "${prep}; ${examprompt}" C-m
    tmux select-pane -t 2
    tmux send-keys -t "${session}" "${prep}; ${subjectpdf}" C-m
    tmux select-pane -t 3
    tmux send-keys -t "${session}" "${prep}; ${challenge1}" C-m
}

# TODO: Fix if sent to background
# Main loop to restart Vim and Tmux if they exit
stty -echo
export PS1=''
/start_score
while true; do
    start_vim_and_tmux
    if [[ $? -ne 0 ]]; then
        echo "Vim or Tmux exited unexpectedly. Restarting..."
    fi
done


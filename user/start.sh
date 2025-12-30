#!/bin/sh

main_session="main"
session="exam-o-tron"
window="exam-o-tron"

# scoreboard="watch -t 'cat /result/scoreboard /scoreboard/score.board | head -60 | /tte spotlights'"
hawk1="cat /result/scoreboard; awk '{ printf \"%20s %1s %19sm%02ds %14s %-26s\n\", \$1, \"|\", \$2, \$3, \"|\", \$4 }' /scoreboard/score.board"
hawk2="cat /result/scoreboard; awk '\''{ printf \"%20s %1s %19sm%02ds %14s %-26s\n\", \$1, \"|\", \$2, \$3, \"|\", \$4 }'\'' /scoreboard/score.board"

prep="unset PS1; stty -echo; trap '' SIGTSTP; clear; sleep 0.1"

scoreboard="{ $hawk1; } | /tte spotlights ; /root/watchcat /scoreboard/score.board 'clear; { $hawk2; } | /tte spotlights' 1"
title="watch -t -n 60 'cat /title | /tte --ignore-terminal-dimensions expand --final-gradient-steps 2 --final-gradient-frame 2'"
timer_cmd="/timer 5 42; tmux set-option -t '${session}' -g status-style 'bg=red'"
examprompt="tmux popup -E -t '${session}' -c '$(tmux lsc -t "${session}" | cut -d: -f1)' figlet -t -c 'PRESS ESC TO START'; exit"
subjectpdf="cat en.subject1.pdf | /tte print"
challenge="while :; do PAGER=more vim \"challenge\$(cat /rendu/clvl).c\" +17; done"
attach_to_nested="TMUX= tmux attach -t '${session}'"

#status="watch -t -n 1 'cat /result/1 | figlet -t -c | /tte matrix'"

# Start Vim and Tmux with the specified file
start_vim_and_tmux() {
    tmux -2 new-session -d -s "${main_session}" -x 240 -y 67
    tmux -2 new-session -d -s "${session}" -x 240 -y 67

    tmux set-option -t "${main_session}" default-size 240x67
    tmux set-option -t "${main_session}" window-size manual

    tmux rename-window -t "${session}:0" "${window}"

    tmux send-keys     -t "${session}:0" "sleep 0.42" C-m
    tmux splitw        -t "${session}:0" -v -l '75%'
    tmux splitw        -t "${session}:0" -h -l '80%'
    tmux splitw        -t "${session}:0" -h -l '58%'
    tmux send-keys     -t "${session}:0" "${prep}; ${scoreboard}" C-m
    tmux select-pane   -t "${session}:0.0"
    tmux splitw        -t "${session}:0" -h -l '85%'
    tmux send-keys     -t "${session}:0" "${prep}; ${title}" C-m
    tmux select-pane   -t "${session}:0.0"
    tmux send-keys     -t "${session}:0" "${prep}; ${timer_cmd}" C-m
    tmux splitw        -t "${session}:0.{top-left}"
    tmux send-keys     -t "${session}:0.1" "tty > /tmp/msgpts && clear && >/dev/null cat" C-m
    #tmux send-keys    -t "${session}:0" "${prep}; ${examprompt}" C-m # TODO
    tmux select-pane   -t "${session}:0.3"
    tmux send-keys     -t "${session}:0" "${prep}; ${subjectpdf}" C-m
    tmux select-pane   -t "${session}:0.4"
    tmux send-keys     -t "${session}:0" "${prep}; ${challenge}" C-m

    tmux send-keys     -t "${main_session}:0" "${attach_to_nested}" C-m
    tmux attach        -t "${main_session}"
}

./scoreboard
# TODO: Fix if sent to background
# Main loop to restart Vim and Tmux if they exit
stty -echo
export PS1=''
stty rows 67 cols 240

# Create a scoreboard file if it doesn't exist
if [ ! -f /scoreboard/score.board ]; then
    touch /scoreboard/score.board
fi

#start_vim_and_tmux
#sleep .1
#/start_score

start_vim_and_tmux

#while true; do
#    start_vim_and_tmux
#    if [[ $? -ne 0 ]]; then
#        echo "Vim or Tmux exited unexpectedly. Restarting..."
#    fi
#done
#tail -f /dev/null

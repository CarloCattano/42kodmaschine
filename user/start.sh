#!/bin/sh

main_session="main"
session="kodmaschine"
window="Exam-O-Tron"

title="watch -t -n 60 'cat /title | /tte binarypath --movement-speed 3'"

# scoreboard="watch -t 'cat /result/scoreboard /scoreboard/score.board | /tte spotlights'"
hawk1="cat /result/scoreboard; awk '{ printf \"%20s %1s %19sm%02ds %14s %-26s\n\", \$1, \"|\", \$2, \$3, \"|\", \$4 }' /scoreboard/score.board"
hawk2="cat /result/scoreboard; awk '\''{ printf \"%20s %1s %19sm%02ds %14s %-26s\n\", \$1, \"|\", \$2, \$3, \"|\", \$4 }'\'' /scoreboard/score.board"
scoreboard="clear; { $hawk1; } | /tte spotlights ; /root/watchcat /scoreboard/score.board 'clear; { $hawk2; } | /tte spotlights' 1"

examprompt="sleep 0.1; tmux popup -E -t ${session} -c '$(tmux lsc -t "${session}" | cut -d: -f1)' figlet -t -c 'PRESS ESC TO START'; exit"
subjectpdf="clear; cat en.subject1.pdf | /tte print"

challenge="sleep 0.1; while :; do vim \"challenge\$(cat /rendu/clvl).c\" +17; done"

attach_to_nested="TMUX= tmux attach -t '${session}'"

timer_cmd="sleep 0.1; /timer 5 42; tmux set -g status-style 'bg=red'"

prep="unset PS1; stty -echo; trap '' SIGTSTP; clear"

#status="watch -t -n 1 'cat /result/1 | figlet -t -c | /tte matrix'"

# Start Vim and Tmux with the specified file
start_vim_and_tmux() {
    tmux -2 new-session -d -s "${main_session}" -x 240 -y 66
    tmux -2 new-session -d -s "${session}" -x 240 -y 65

    tmux set-option -g default-size 240x65
    tmux set-option -g window-size manual

    tmux rename-window -t "${session}" "${window}"

    tmux send-keys     -t "${session}" "sleep 0.42" C-m
    tmux splitw        -t "${session}" -v -l '75%'
    tmux splitw        -t "${session}" -h -l '70%'
    tmux splitw        -t "${session}" -h -l '50%'
    tmux send-keys     -t "${session}" "${prep}; ${scoreboard}" C-m
    tmux select-pane   -t 0
    tmux splitw        -t "${session}" -h -l '80%'
    tmux send-keys     -t "${session}" "${prep}; ${title}" C-m
    tmux select-pane   -t 0
    tmux send-keys     -t "${session}" "${prep}; ${timer_cmd}" C-m
    tmux splitw        -t "${session}.{top-left}"
    tmux send-keys     -t "${session}.1" "clear && >/dev/null cat" C-m
    #tmux send-keys    -t "${session}" "${prep}; ${examprompt}" C-m # TODO
    tmux select-pane   -t 3
    tmux send-keys     -t "${session}" "${prep}; ${subjectpdf}" C-m
    tmux select-pane   -t 4
    tmux send-keys     -t "${session}" "${prep}; ${challenge}" C-m

    tmux send-keys     -t "${main_session}" "${attach_to_nested}" C-m
    tmux attach        -t "${main_session}"
    # tmux attach        -t "${session}"
}

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

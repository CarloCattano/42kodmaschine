#!/bin/sh

cp /orig.c /rendu/challenge1.c

session="kodmaschine"
window="challengePanel"

# Function to start Vim and Tmux with the specified file
start_vim_and_tmux() {
    tmux new-session -s "${session}" -d -A
    tmux rename-window -t "${session}" "${window}"
    tmux split-window  -t "${session}:${window}" -h -l '16%'
    tmux split-window  -t "${session}:${window}" -v -l '22%'
    sleep 0.1
    tmux send-keys -t "${session}:${window}" "/bin/sh /timer 5 42" C-m  # Start timer
    tmux select-pane   -t 1
    sleep 0.42
    tmux send-keys -t "${session}:${window}" "reset" C-m  # Reset terminal
    tmux send-keys -t "${session}:${window}" "stty sane" C-m  # Set sane terminal
    tmux send-keys -t "${session}:${window}" "vim challenge1.c" C-m
    sleep 1
    tmux send-keys -t "${session}:${window}" V G g g Escape
    sleep 0.1
}

# Main loop to restart Vim and Tmux if they exit
while true; do
    start_vim_and_tmux
    if [[ $? -ne 0 ]]; then
        echo "Vim or Tmux exited unexpectedly. Restarting..."
    fi
done


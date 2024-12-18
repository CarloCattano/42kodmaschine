#!/usr/bin/bash

set -euxo pipefail

builtin -- cd -P -e -- "/mnt/media/media/Scripts"

session="whatever"
window="windowlol"

export SHELL="/usr/bin/bash"
tmux new-session -s "${session}" -d || { echo "$(date): Tmux: Duplicate session: '$session'" >> /root/lol.log; exit 1; }

tmux rename-window -t "${session}" "${window}"
tmux send-keys     -t "${session}:${window}" './thv_renamer.sh movie' ENTER
tmux split-window  -t "${session}:${window}" -v -l '80%'
tmux send-keys     -t "${session}:${window}" './thv_renamer.sh tv' ENTER
tmux split-window  -t "${session}:${window}" -v -l '75%'
tmux send-keys     -t "${session}:${window}" './thv_renamer.sh ani' ENTER
tmux split-window  -t "${session}:${window}" -v -l '67%'
tmux send-keys     -t "${session}:${window}" './thv_renamer.sh docu' ENTER
tmux split-window  -t "${session}:${window}" -v -l '50%'
tmux send-keys     -t "${session}:${window}" './thv_renamer.sh docu-series' ENTER
tmux split-window  -t "${session}:${window}" -h -l '50%'
tmux send-keys     -t "${session}:${window}" './thv_renamer.sh horror' ENTER
tmux select-pane   -t "${session}:${window}.{top}"

tmux new-window    -t "${session}" -c '/var/www/automarrrrt/'
tmux rename-window -t "${session}" "automarrrrt"
tmux send-keys     -t "${session}:automarrrrt" 'sudo --user="www-data" -- bash' ENTER
tmux send-keys     -t "${session}:automarrrrt" '. /var/www/automarrrrt/env/bin/activate' ENTER
tmux send-keys     -t "${session}:automarrrrt" './main.py' ENTER


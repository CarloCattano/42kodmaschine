# 42kodmaschine

```bash
make up
make user
```
boots into vim .

```bash
make moulinette
```
runs the tests


## HARDWARE standalone coding challenge totem

A screen, a keyboard and a BIG red button ( submit -> push -> grademe )
User gets booted to vim, inside an alpine container , running on a 42 minishell

Simple excercises from 42,   N minutes timer to complete . Red light bulb for fail , something else for success

```bash
mkdir .ssh
cd .ssh/
nano authorized_keys
```

```tmux sane
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
```

```
https://github.com/charmbracelet/bubbles
```

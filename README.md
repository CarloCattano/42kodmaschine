# 42kodmaschine

## initial boot to tty
The pi boots and autologins to tty1, tty1 is detected and make user is triggered
via .bash_profile

```bash
make user # triggers the user environment with tmux and vim
```

```bash
make moulinette
```
runs the tests


## HARDWARE standalone coding challenge totem

A screen, a keyboard and a BIG red button ( submit -> push -> grademe )
User gets booted to vim, inside an alpine container , running on a 42 minishell

Simple excercises from 42,   N minutes timer to complete . Red light bulb for fail , something else for success


## SSH access
With an ethernet cable , the pi should be acessible with 
```bash
ssh exam@examshell.local
```

## systemd button.service
located at /etc/systemd/system/button.service
listens for button press, prints button pressed

## TODO's | COULD DO's
(https://github.com/users/CarloCattano/projects/1)[TODO's]


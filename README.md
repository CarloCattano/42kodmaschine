# Exam-O-Tron

Done for the c3 conference 2024 by 42 Berlin students and Fablab Neukolln

## What is it?
A standalone machine with just a screen, a keyboard and a button.
Users are presented with simple yet challenging coding challenges, in a tmux interface on a tty.
Exiting vim is nearly imposible by design, and there is scoreboard, challenge subject, timer and some ascii art.

## How does it work?
The machine is a raspberry pi with a custom image, that boots directly into a tty with a tmux session running inside an alpine container.

<br>
<img src="./ccc.gif"/>

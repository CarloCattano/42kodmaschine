# 42kodmaschine

build user container:
```bash
cd user/ 
docker build -t user . 
docker run -it --rm -v $(pwd)/../rendu:/rendu user
```

build moulinette container:
```bash
cd moulinette
docker build -t moulinette . 
docker run -it --rm -v $(pwd)/../rendu:/rendu moulinette
```


## HARDWARE standalone coding challenge totem

A screen, a keyboard and a BIG red button ( submit -> push -> grademe )
User gets booted to vim, inside an alpine container , running on a 42 minishell

Simple excercises from 42,   N minutes timer to complete . Red light bulb for fail , something else for success

```bash
mkdir .ssh
cd .ssh/
nano authorized_keys
```

```Dockerfile
FROM alpine:3.20
RUN apk add --no-cache vim libc-dev git nano gcc python3 vim
# TODO add student minishell , compile and boot to it 
RUN mkdir -p /codechallenge && touch /codechallenge/challenge1.c
COPY challenge1.c /codechallenge/

ENTRYPOINT ["vim", "/codechallenge/challenge1.c"]
```

```
docker run -it --rm -v $(pwd):/codechallenge kodmachine
```
### Write a function that puts "a\/n" to the standart output without using printf or any derivates. 

Success:
	- Using write ok
	- Inline assembly ok 
	- system(python , -c print(a))    ok
	- other means ok
Failure:
	  - printf fprintf puts putchar fputs vprintf vfprintf putc

TODO:
   - Dockerfile for moulinette.sh separated form challenge container 
   - Moulinette that checks only stdout   _cc main.c codechallenge1.c -o out ; ./out | cat -e     ->      "a/\n"
   - Parser  or protection against printf and derivatives
   - -W flags ? 
   - Parsing for **printf** and throw error 
   - Submit big red button 
   - Live logs of submissions into a CRT or screen or self hosted
		- User l33t just failed challenge1.c -> display their solution  
## challenge1.c

Write an 'a' follwed by a new line to Standart output without using printf
We will test it with out own main.
Press red button to be graded.
### Tester
```bash
#/bin/env sh

# Moulinette tester for codechallenges
# Usage : moulinette.sh codechallenge1.c "expected_result"

CHALLENGE1=$1q
# Check for forbidden functions TODO mcutura
gcc main.c $CHALLENGE1 -o out

TEST_RETURN=$(./out | cat -e)

if [ "$TEST_RETURN" = "$2" ]; then
    echo "Test passed"
else
    echo "Test failed"
fi
```

main.c
```c
#include <unistd.h>
#include "challenge.h"

int main() {
    print_a();
}
```

challenge.h
```c
#include <stdio.h>

void print_a();
```

codechallege1.c
```c
void print_a()
{
	// Your implementation here
}
```

# CTF
CTF Framework https://github.com/CTFd/CTFd

- TODO : add CTF Challenges
	github.com/CarloCattano/CommunityCTF.git


### raspberry setup 
```bash
sudo apt update
sudo apt install docker git build-essential cmake htop vim
curl -fsSL https://get.docker.com -o get-docker.sh
sudo useradd docker $USER
```

https://raspberrypihq.com/use-a-push-button-with-raspberry-pi-gpio/

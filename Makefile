NAME := 42kodmaschine

DC := docker compose
COMP := compose.yaml

cyn := \033[36m
magb := \033[1;35m
clr := \033[0m

.PHONY: build up down start stop clean ps logs user kill moulinette help

build:	# Construct
	$(DC) -f $(COMP) build
re: kill down	# re
	$(DC) -f $(COMP) up --build --force-recreate --remove-orphans -d
up:	# escalate
	$(DC) -f $(COMP) up --build -d
down:	# deescalate
	$(DC) -f $(COMP) down --remove-orphans
start:	# start
	$(DC) -f $(COMP) start -d
stop:	# stop
	$(DC) -f $(COMP) stop
clean: stop	# prune AF
	@printf "$(cyn)This will fully prune the docker system!\n$(magb)Are you sure? $(cyn)(Y/n)$(clr) "
	@read CONFIRM ; if [[ $$CONFIRM == 'Y' ]]; then docker system prune -af ; fi
ps:	# Show me the procs
	$(DC) -f $(COMP) ps
logs:	# Show me results
	$(DC) -f $(COMP) logs --tail=100 -f moulinette
user:	# run user
	$(DC) -f $(COMP) run --rm user
examshell:	# start exam
	$(DC) -f $(COMP) exec user /root/start.sh
kill:	# murder
	$(DC) -f $(COMP) kill user
restart: kill down up	# A New Hope
	echo "$(magb)Restarted $(NAME)$(clr)"
moulinette:	# grademe
#	$(DC) -f $(COMP) run --rm moulinette
	-$(DC) -f $(COMP) exec moulinette /kod/moulinette.sh 1 /rendu/challenge1.c /kod/main.c /kod/c1out_compare
	-$(DC) -f $(COMP) exec user sh -c "tmux popup -t kodmaschine:0 -h 50% -w 60% -x 20% -y 40% 'figlet Loading... please wait... Calculating results... | /tte vhstape --total-glitch-time 200 && echo Results ready! Press ESC to continue...'"
	-$(DC) -f $(COMP) exec user /start_score
help:	# plshelp
	@awk 'BEGIN { \
	FS = ":.*#"; printf "Usage:\n\t$(cyn)make $(magb)<target> \
	$(clr)\n\nTargets:\n"; } \
	/^[a-zA-Z_0-9-]+:.*?#/ { \
	printf "$(magb)%-16s$(cyn)%s$(clr)\n", $$1, $$2 } ' \
       	Makefile

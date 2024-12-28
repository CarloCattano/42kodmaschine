NAME := 42kodmaschine

DC := docker compose
COMP := compose.yaml
RM := rm

cyn := \033[36m
magb := \033[1;35m
clr := \033[0m

.PHONY: build up down start stop clean ps logs user kill moulinette help

build:	# Construct
	$(DC) -f $(COMP) build
re: kill down	# re
	$(DC) -f $(COMP) up --build --force-recreate --remove-orphans -d
up:	# escalate
	$(DC) -f $(COMP) up --build -d # make sure to not use --no-cache and to have the alpine image locally when using --build
down:	# deescalate
	$(DC) -f $(COMP) down --remove-orphans
start:	# start
	$(DC) -f $(COMP) start
stop:	# stop
	$(DC) -f $(COMP) stop
clean: stop	# prune AF
	@printf "$(cyn)This will fully prune the docker system!\n$(magb)Are you sure? $(cyn)(Y/n)$(clr) "
	@$(shell read CONFIRM; if [[ $$CONFIRM == 'Y' ]]; then docker system prune -af ; fi)
	-$(RM) -f ./result/1
	-$(RM) -f ./result/2
	-$(RM) -f ./result/3
	-$(RM) -f ./result/.session
ps:	# Show me the procs
	$(DC) -f $(COMP) ps
logs:	# Show me results
	$(DC) -f $(COMP) logs --tail=100 -f moulinette
user:	# run user
	$(RM) -fr rendu/* result/*
	cp skel/rendu/* rendu/
	cp skel/result/* result/
	$(DC) -f $(COMP) run --rm user
examshell:	# start exam
	$(DC) -f $(COMP) exec user /root/start.sh
attachexam: start # attaches to exam
	$(RM) -fr rendu/* result/*
	cp skel/rendu/* rendu/
	cp skel/result/* result/
	docker attach kodmaschine-user-1
kill:	# murder
	$(DC) -f $(COMP) kill user
restart: kill down up	# A New Hope
	echo "$(magb)Restarted $(NAME)$(clr)"
moulinette:	# grademe
	echo MOULINETTE TARGET
	-$(DC) -f $(COMP) exec moulinette $(shell sh ./moulinette/progress.sh)
	-$(DC) -f $(COMP) exec user sh -c "tmux popup -E -t kodmaschine:0 'figlet -t -c Loading... please wait... Calculating results... | /tte vhstape --total-glitch-time 100 ; sleep 1'"
	-$(DC) -f $(COMP) exec user /start_score
help:	# plshelp
	@awk 'BEGIN { \
	FS = ":.*#"; printf "Usage:\n\t$(cyn)make $(magb)<target> \
	$(clr)\n\nTargets:\n"; } \
	/^[a-zA-Z_0-9-]+:.*?#/ { \
	printf "$(magb)%-16s$(cyn)%s$(clr)\n", $$1, $$2 } ' \
       	Makefile
fix: # Recover tty1 (spawns login process (/sbin/agetty) in the empty framebuffer console tty1)
	sudo systemctl restart getty@tty1

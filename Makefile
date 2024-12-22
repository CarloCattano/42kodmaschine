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
	$(DC) -f $(COMP) down
start:	# start
	$(DC) -f $(COMP) start -d
stop:	# stop
	$(DC) -f $(COMP) stop
clean: stop	# TODO: Figure out what to clean
	@echo "What? clean what?"
ps:	# Show me the procs
	$(DC) -f $(COMP) ps
logs:	# Show me results
	$(DC) -f $(COMP) logs --tail=100 -f moulinette
user:	# run user miniexamshell
	$(DC) -f $(COMP) run user
	#$(DC) -f $(COMP) run user sh > /dev/tty1 2>&1

kill:	# murder
	$(DC) -f $(COMP) kill user

restart: kill down up	# A New Hope
	echo "Restarted $(NAME)"
#	docker run -it kodmaschine-user
moulinette:	# grademe
	$(DC) -f $(COMP) run moulinette
#	docker run -it kodmaschine-moulinette
help:	# plshelp
	@awk 'BEGIN { \
	FS = ":.*#"; printf "Usage:\n\t$(cyn)make $(magb)<target> \
	$(clr)\n\nTargets:\n"; } \
	/^[a-zA-Z_0-9-]+:.*?#/ { \
	printf "$(magb)%-16s$(cyn)%s$(clr)\n", $$1, $$2 } ' \
       	Makefile


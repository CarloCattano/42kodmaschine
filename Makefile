NAME := 42kodmaschine

DC := docker compose
COMP := compose.yaml

.PHONY: build up down start stop clean ps logs user moulinette help
build:
	$(DC) -f $(COMP) build
up:
	$(DC) -f $(COMP) up --build -d 
down:
	$(DC) -f $(COMP) down
start:
	$(DC) -f $(COMP) start -d
stop:
	$(DC) -f $(COMP) stop
clean: stop
	@echo "What? clean what?"
ps:
	$(DC) -f $(COMP) ps
logs:
	$(DC) -f $(COMP) logs --tail=100 -f moulinette
user:
	$(DC) -f $(COMP) exec user vim /rendu/challenge1.c
#	docker run -it kodmaschine-user
moulinette:
	$(DC) -f $(COMP) run moulinette
#	docker run -it kodmaschine-moulinette

help: #TODO: pls help

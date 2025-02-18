NAME := 42kodmaschine

DC := docker compose
COMP := compose.yaml
RM := rm
RM := rm

cyn := \033[36m
magb := \033[1;35m
clr := \033[0m

.PHONY: build up down start stop clean ps logs user kill moulinette dirs help

build:	# Construct
	$(DC) -f $(COMP) build
re:
	$(MAKE) kill
	$(MAKE) down
	$(DC) -f $(COMP) up --build --force-recreate --remove-orphans -d
up:	# escalate
	$(DC) -f $(COMP) up --build -d # make sure to not use --no-cache and to have the alpine image locally when using --build
down:	# deescalate
	$(DC) -f $(COMP) down --remove-orphans
start:	# start
	$(DC) -f $(COMP) start
stop:	# stop
	$(DC) -f $(COMP) stop
clean:
	$(MAKE) stop
	@printf "$(cyn)This will fully prune the docker system!\n$(magb)Are you sure? $(cyn)(Y/n)$(clr) "
	@$(shell read CONFIRM; if [[ $$CONFIRM == 'Y' ]]; then docker system prune -af ; fi)
	sudo -$(RM) -f ./result/*
ps:	# Show me the procs
	$(DC) -f $(COMP) ps
logs:	# Show me results
	$(DC) -f $(COMP) logs --tail=100 -f moulinette
dirs: 	# Ensure clean working dirs
	sudo $(RM) -fr rendu result
	mkdir rendu result
	cp skel/rendu/* rendu/
	echo 1 > rendu/clvl
	cp skel/result/* result/
user:
	$(MAKE) dirs
	$(DC) -f $(COMP) run --rm user
examshell:	# start exam
	$(DC) -f $(COMP) exec user /root/start.sh
restartexam:
	$(MAKE) kill
	$(MAKE) dirs
	$(MAKE) up
	docker attach kodmaschine-user-1
attachexam:
	docker attach kodmaschine-user-1
kill:	# murder
	-docker rm -f $(docker ps -q) 1>/dev/null 2>/dev/null
	$(DC) -f $(COMP) kill user
restart:
	$(MAKE) kill
	$(MAKE) down
	$(MAKE) up
	echo "$(magb)Restarted $(NAME)$(clr)"
moulinette:	# grademe
	echo MOULINETTE TARGET
	-$(DC) -f $(COMP) exec moulinette $(shell sh ./moulinette/progress.sh)
	-$(DC) -f $(COMP) exec user sh -c "tmux popup -E -t kodmaschine -c $$($(DC) -f $(COMP) exec user sh -c 'tmux lsc -t kodmaschine' | cut -d: -f1) 'figlet -t -c Loading... please wait... Calculating results... | /tte vhstape --total-glitch-time 100 ; sleep 1'"
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
cheat:
	$(MAKE) kill
	$(MAKE) up
	sudo $(RM) -fr rendu/* result/*
	cp skel/rendu/* rendu/
	echo 4 > rendu/clvl
	cp skel/result/* result/
	echo "[OK]" > result/1
	echo "[OK]" > result/2
	echo "[OK]" > result/3
	docker attach kodmaschine-user-1

service:
	@REPO_ROOT="$$(git rev-parse --show-toplevel)" envsubst '$$REPO_ROOT' < button.service | sudo tee /etc/systemd/system/button.service && echo "Successfully created service file" || echo "Failed to create service file"
	@echo
	sudo systemctl daemon-reload
	sudo systemctl restart button
	systemctl status button
	@echo

autologin:
	@[ -e /etc/systemd/system/getty@tty1.service.d ] && echo "getty@tty1 directory already exists! Please manually handle this situation! This must be on autologin.conf in the aforementioned directory:" && printf '\n\t[Service]\n\tExecStart=\n\tExecStart=-/sbin/agetty --autologin pi --noclear %%I $$TERM\n\n' && false || true
	sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
	printf '[Service]\nExecStart=\nExecStart=-/sbin/agetty --autologin pi --noclear %%I $$TERM\n' | sudo tee /etc/systemd/system/getty@tty1.service.d/autologin.conf

profile:
	@[ -e ~/.bash_profile ] && echo "Error, $$HOME/.bash_profile already exists. Please delete it!" && false || true
	@REPO_ROOT="$$(git rev-parse --show-toplevel)" envsubst '$$REPO_ROOT' < .bash_profile > ~/.bash_profile
	@echo "Successully copied ./.bash_profile to home directory: $$HOME"

font:
	@echo "Run the following command: sudo dpkg-reconfigure console-setup"
	@echo "And then select UTF8 -> Guess optimal character set -> TerminusBold"
	@echo "And then, if it's a 1920x1080 display, select 8x16"
	@echo "If it's a 4K (3840x2160) display, select 16x32"

switch:
	sudo pkill -9 -t tty1
	sudo chvt 1

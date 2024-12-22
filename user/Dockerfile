FROM alpine:3.20
RUN apk add --no-cache vim tmux figlet font-awesome font-hack-nerd
ENV TERM=screen-256color
COPY tmux.conf /root/.tmux.conf
COPY catppuccin /root/catppuccin
COPY .vimrc /root/.vimrc
COPY start.sh /root/start.sh
COPY timer timer
RUN chmod 0111 timer
RUN fc-cache -fv

WORKDIR rendu
ENTRYPOINT ["/bin/sh", "/root/start.sh"]

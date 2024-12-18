FROM alpine:3.20
RUN apk add --no-cache vim tmux figlet
COPY .vimrc /root/.vimrc
COPY start.sh /root/start.sh
COPY timer timer
COPY orig.c orig.c
COPY tmux.conf /root/.tmux.conf

WORKDIR rendu
ENTRYPOINT ["/bin/sh", "/root/start.sh"]
# ENTRYPOINT ["vim", "challenge1.c"]

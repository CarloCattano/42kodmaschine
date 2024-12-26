FROM alpine:3.20
ENV TERM=screen-256color
RUN apk add --no-cache vim tmux figlet

COPY tmux.conf /root/.tmux.conf
COPY .vimrc /root/.vimrc

COPY --chmod=111 timer timer
COPY --chmod=111 tte tte
COPY fraktur.flf /usr/share/figlet/fonts/fraktur.flf
COPY title /title
COPY --chmod=111 scoreboard /start_score
COPY --chmod=111 dwatchcat /root/watchcat

COPY start.sh /root/start.sh

WORKDIR rendu
ENTRYPOINT ["/bin/sh", "/root/start.sh"]

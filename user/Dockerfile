FROM alpine:3.20
ENV TERM=tmux-256color
RUN apk add vim tmux figlet man-db man-pages

# Temporary fix
RUN apk add py3-pip
RUN pip install --break-system-packages terminaltexteffects
RUN cp $(which tte) /tte

COPY --chmod=111 timer timer
COPY --chmod=111 tte tte
COPY fraktur.flf /usr/share/figlet/fonts/fraktur.flf
COPY title /title
COPY --chmod=111 scoreboard /start_score
COPY --chmod=111 dwatchcat /root/watchcat

COPY --chmod=111 solutions/c1.c /root/c1.c
COPY --chmod=111 solutions/fizzbuzz.c /root/fizzbuzz.c
COPY --chmod=111 solutions/rotn.c /root/rotn.c
COPY --chmod=111 solutions/sigill.c /root/sigill.c

COPY start.sh /root/start.sh

COPY tmux.conf /root/.tmux.conf
COPY .vimrc /root/.vimrc

WORKDIR rendu
ENTRYPOINT ["/bin/sh", "/root/start.sh"]

FROM alpine:3.20
RUN apk add --no-cache vim 
COPY .vimrc /root/.vimrc
WORKDIR rendu
ENTRYPOINT ["vim", "challenge1.c"]


FROM alpine:3.20
RUN apk add --no-cache vim 
RUN echo 'set noswapfile' >/root/.vimrc
WORKDIR rendu
ENTRYPOINT ["vim", "challenge1.c"]


FROM alpine:3.20
RUN apk add --no-cache vim 
RUN echo 'cnoremap q echo "=====================\n    BIG MESSAGE!\n=====================" | redraw!' > /root/.vimrc
RUN echo 'cnoremap q echo "=====================\n    BIG MESSAGE!\n=====================" | redraw!' > /root/.vimrc
RUN mkdir /rendu
CMD ["vim", "/rendu/challenge1.c"]


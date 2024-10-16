FROM alpine:3.20
RUN apk add --no-cache vim 
RUN echo 'cnoremap q echo "=====================\n    BIG MESSAGE!\n=====================" | redraw!' > /root/.vimrc
# if user exists vim , restart the container
# ENTRYPOINT ["vim", "/rendu/challenge1.c"]
CMD ["vim", "/rendu/challenge1.c"]


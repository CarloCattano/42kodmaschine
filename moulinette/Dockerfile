FROM alpine:3.20
RUN apk add --no-cache vim libc-dev git nano gcc python3

WORKDIR /kod
COPY main.c .
COPY moulinette.sh .
COPY poison .
RUN mkdir -p /rendu

# run moulinette with challenge1.c as argument
CMD ["sh", "moulinette.sh", "/rendu/challenge1.c", "a$"]

#ENTRYPOINT ["sh", "/kod/moulinette.sh", "/rendu/challenge1.c", "a$"]

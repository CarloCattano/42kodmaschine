FROM alpine:3.20
RUN apk add --no-cache vim libc-dev gcc python3

WORKDIR /kod
COPY main.c .
COPY moulinette.sh .
COPY poison .
RUN mkdir -p /rendu

# run moulinette with challenge1.c as argument
ENTRYPOINT ["tail", "-f"]
CMD ["sh", "moulinette.sh", "/rendu/challenge1.c", "a$"]


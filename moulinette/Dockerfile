FROM alpine:3.14
RUN apk add --no-cache vim libc-dev git nano gcc python3

COPY main.c .
COPY challenge.h challenge.h
COPY moulinette.sh .


# run moulinette with challenge1.c as argument
CMD ["sh", "moulinette.sh", "/rendu/challenge1.c", "a$"]


# ENTRYPOINT ["sh", "/codechallenge/challenge1.c"]

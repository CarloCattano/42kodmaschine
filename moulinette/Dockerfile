FROM alpine:3.20
RUN apk add --no-cache vim libc-dev git nano gcc python3

COPY main.c .
COPY challenge.h challenge.h
COPY moulinette.sh .
RUN mkdir /rendu

# run moulinette with challenge1.c as argument
CMD ["sh", "moulinette.sh", "/rendu/challenge1.c", "a$"]


# ENTRYPOINT ["sh", "/codechallenge/challenge1.c"]

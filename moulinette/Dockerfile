FROM alpine:3.20
RUN apk add --no-cache vim libc-dev gcc python3 bash

WORKDIR /kod
COPY main.c .
COPY moulinette.sh .
COPY poison .
COPY c1out_compare .
RUN mkdir -p /rendu

ENTRYPOINT ["tail", "-f"]
CMD ["sh", "moulinette.sh", "1", "/rendu/challenge1.c", "main.c", "c1out_compare"]


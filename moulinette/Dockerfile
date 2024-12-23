FROM alpine:3.20
RUN apk add --no-cache vim libc-dev gcc python3 bash

WORKDIR /kod

# Tests
COPY c1_tests.c .
COPY c2_tests.c .
COPY c3_tests.c .

# Expected outputs
COPY c1_expected.out .
COPY c2_expected.out .
COPY c3_expected.out .

# Solutions
COPY solutions/c1.c c1_sol.c
COPY solutions/fizzbuzz.c c2_sol.c
COPY solutions/rotn.c c3_sol.c

# Moulinette
COPY poison .
COPY moulinette.sh .

RUN mkdir -p /rendu

ENTRYPOINT ["tail", "-f"]
CMD ["sh", "moulinette.sh", "1", "c1_sol.c", "c1_tests.c", "c1_expected.out"]



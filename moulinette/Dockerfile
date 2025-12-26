FROM alpine:3.20
RUN apk add libc-dev gcc python3 sudo

WORKDIR /kod

# Tests
COPY c1_tests.c .
COPY c2_tests.c .
COPY c3_tests.c .
COPY c4_tests.c .

# Expected outputs
COPY c1_expected.out .
COPY c2_expected.out .
COPY c3_expected.out .
COPY c4_expected.out .

# Solutions
COPY solutions/c1.c c1_sol.c
COPY solutions/fizzbuzz.c c2_sol.c
COPY solutions/rotn.c c3_sol.c

# Moulinette
COPY poison .
COPY moulinette.sh .
# for every entry 6 hours 2 meals 1 shower
COPY --chmod=621 entrypoint.sh .
# COPY progress.sh . # NO DONT
COPY --chmod=111 deep_thought /deep_thought

RUN mkdir -p /rendu

ENTRYPOINT ["./entrypoint.sh"]
#CMD ["sh", "moulinette.sh", "1", "c1_sol.c", "c1_tests.c", "c1_expected.out"]

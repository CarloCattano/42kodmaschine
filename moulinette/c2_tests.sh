#!/bin/sh

# Moulinette tester for challenge2

cc -Wall -Wextra -Werror ../rendu/challenge2.c c2_tests.c -o c2.out

if [ $? -ne 0 ]; then
    echo "Compilation failed"
    exit 1
fi

nm -u c2.out | grep -v "w __cxa_finalize@GLIBC_2.2.5"\
             | grep -v "w __gmon_start__"\
             | grep -v "w _ITM_deregisterTMCloneTable"\
             | grep -v "w _ITM_registerTMCloneTable"\
             | grep -v "U __libc_start_main@GLIBC_2.34" > c2_nm.out

diff c2_nm.out c2_nm_expected.out > /dev/null

if [ $? -eq 0 ]; then
    echo "No forbidden functions detected"
else
    echo "Forbidden functions detected"
fi

rm -f c2_nm.out

./c2.out > c2_user.out

diff c2_user.out c2_expected.out > /dev/null

if [ $? -eq 0 ]; then
    echo "Test passed"
else
    echo "Test failed"
fi

rm -f c2.out c2_user.out
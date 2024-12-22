#!/bin/sh

# Moulinette tester for codechallenges
# moulinette.sh codechallenge1.c expected result 

export CHALLENGE1=$1

RESULT=/result/1
# Check for forbidden functions
if [ ! -f poison ]; then
    echo "Error: poison file not found!"
    exit 1
fi

# Dont check comments ( `//   `/* ... */`)
CLEANED_CODE=$(sed -E 's|//.*||; s|/\*[^*]*\*+([^/*][^*]*\*+)*/||g' $CHALLENGE1)

if echo "$CLEANED_CODE" | grep -w -f poison > /dev/null; then
    # printf "\033[0;31mForbidden function detected !!!! \033[0m\n"
    printf "[ILLEGAL]\n" >"$RESULT"
    exit 0
fi

gcc -w $CHALLENGE1 main.c -o out

TEST_RETURN=$(./out | cat -e)

echo "Received: $TEST_RETURN"

if [ "$TEST_RETURN" = "$2" ]; then
    #printf "\033[0;32m\n\tTest passed !!!! \033[0m\n"
    printf "[OK]\n" >"$RESULT"
else
    #printf "\033[0;31m\n\tTest failed !!!! \033[0m\n"
    printf "[KO]\n" >"$RESULT"
fi

rm -fr out


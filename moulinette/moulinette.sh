#!/bin/sh

# Moulinette tester for codechallenges
# moulinette.sh codechallenge1.c expected result 

set -e

export CHALLENGE1=$1

# Check for forbidden functions
# TODO mcutura DONE
if [ ! -f poison ]; then
    echo "Error: poison file not found!"
    exit 1
fi

#supressed warnings for now
grep -w -f poison $CHALLENGE1

# Compile the codechallenge1.c file with our main.c 
gcc $CHALLENGE1 main.c -o out

#run the compiled file
TEST_RETURN=$(./out | cat -e)

echo "Expected: $2"
echo "Received: $TEST_RETURN"

if [ "$TEST_RETURN" = "$2" ]; then
    printf "\033[0;32mTest passed !!!! \033[0m"
else
    printf "\033[0;31mTest failed !!!! \033[0m"
fi
rm -fr out

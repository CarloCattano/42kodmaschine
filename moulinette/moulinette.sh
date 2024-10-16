#/bin/env sh

# Moulinette tester for codechallenges

# moulinette.sh codechallenge1.c expected result 

set -e # exit on error

export CHALLENGE1=$1

# Check for forbidden functions
# TODO mcutura DONE
grep -f poison $CHALLENGE1

# Compile the codechallenge1.c file with our main.c 
gcc $CHALLENGE1 main.c -o out

#run the compiled file
TEST_RETURN=$(./out | cat -e)

if [ "$TEST_RETURN" = "$2" ]; then
    printf "\033[0;32mTest passed !!!! \033[0m"
else
    printf "\033[0;31mTest failed !!!! \033[0m"
fi
rm -fr out

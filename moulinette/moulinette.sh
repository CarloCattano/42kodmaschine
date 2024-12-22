#!/bin/sh

USAGE="Usage: moulinette.sh <level> <source file> <main source file> \
<expected result (file)>"

if [ "$#" -ne 4 ]; then
    echo "$USAGE"
    exit 1
fi

LEVEL=$1
SOURCEF=$2
MAINF=$3
EXPECTEDF=$4

if [ ! -f $SOURCEF ]; then
    echo "Error: source file not found!"
    exit 1
fi

if [ ! -f $MAINF ]; then
    echo "Error: main source file not found!"
    exit 1
fi

if [ ! -f $EXPECTEDF ]; then
    echo "Error: expected result file not found!"
    exit 1
fi

if [ ! -f poison ]; then
    echo "Error: poison file not found!"
    exit 1
fi

echo "[WIP]" > /result/$LEVEL

gcc -w $MAINF $SOURCEF -o out.$LEVEL 2>&1 > /dev/null

nm out.$LEVEL | grep -f poison > /dev/null

if [ $? -eq 0 ]; then
    printf "[ILLEGAL]\n" > /result/$LEVEL
    exit 1
fi

TEST_OUTPUT=$(./out.$LEVEL | cat -e)

if [ "$TEST_OUTPUT" = "$(cat $EXPECTEDF | cat -e)" ]; then
    printf "[OK]\n" > /result/$LEVEL
else
    printf "[KO]\n" > /result/$LEVEL
fi

rm -f out.$LEVEL compile_log.$LEVEL
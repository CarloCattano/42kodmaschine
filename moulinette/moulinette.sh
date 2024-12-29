#!/bin/sh

USAGE="Usage: moulinette.sh <level> <source file> <main source file> <expected result>"

if [ "$#" -ne 4 ]; then
    echo "$USAGE"
    exit $#
fi

LEVEL=$1
SOURCEF=$2
MAINF=$3
EXPECTEDF=$4

echo "Good debugging"

echo "[WIP]" > /result/$LEVEL
echo "Lev: $LEVEL Src: $SOURCEF Main: $MAINF Exp: $EXPECTEDF"

if [ ! -f $SOURCEF ]; then
    echo "Error: source file ('$SOURCEF') not found!"
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

printf "[KO]\n" > /result/$LEVEL

timeout 10 gcc -w -O0 "$MAINF" "$SOURCEF" -o "out.$LEVEL"

echo "Bazooka"

nm out.$LEVEL | grep -f poison

if [ $? -eq 0 ]; then
    printf "[ILLEGAL]\n" > /result/$LEVEL
    exit 1
fi

/deep_thought ./out.$LEVEL > /result/$LEVEL
if [ $? -ne 0 ]; then
    printf "%s\n%s\n" "[SIGILL]" "$(cat /result/$LEVEL)" > /result/$LEVEL
    exit 1
fi

timeout -k 10 5 "./out.$LEVEL" > "/tmp/out.$LEVEL.stdout"

echo "quantum debugging"

if diff "/tmp/out.$LEVEL.stdout" "$EXPECTEDF"; then
    printf "[OK]\n" > /result/$LEVEL
else
    printf "[KO]\n" > /result/$LEVEL
fi

rm -f out.$LEVEL /tmp/out.$LEVEL.stdout

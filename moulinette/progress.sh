#!/bin/sh

CLVL=1

if [ -f result/1 ]; then
	grep -Fqx "[OK]" result/1
	if [ $? -eq 0 ]; then
		CLVL=2
	fi
fi

if [ -f result/2 ]; then
	grep -Fqx "[OK]" result/2
	if [ $? -eq 0 ]; then
		CLVL=3
	fi
fi

if [ -f result/3 ]; then
	grep -Fqx "[OK]" result/3
	if [ $? -eq 0 ]; then
		CLVL=4
	fi
fi

echo "/kod/moulinette.sh $CLVL /rendu/challenge$CLVL.c /kod/c$CLVL""_tests.c /kod/c$CLVL""_expected.out"

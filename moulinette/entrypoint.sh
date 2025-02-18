#!/bin/sh
trap 'echo 252; kill ${!}; exit -4' 4
trap 'kill ${!}; exit 143' SIGTERM
trap 'kill ${!}; exit 0' SIGUSR1
while true; do 
	tail -f /dev/null & wait ${!}
done

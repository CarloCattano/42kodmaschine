//usr/bin/make &>/dev/null ill; ./ill;s=$?; exit $s
main(){asm volatile(".short 0xde00\n");}

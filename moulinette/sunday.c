//usr/bin/make &>/dev/null ill; ./ill;s=$?; exit $s
void _(int){write(1,"ILL\n",4);}
main(){signal(4,_);system("./ill");}

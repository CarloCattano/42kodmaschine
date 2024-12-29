#include <signal.h>
int main()
{
	raise(SIGILL);
}

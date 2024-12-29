#include <signal.h>

int	main(void)
{
	raise(SIGILL);
	return (0);
}

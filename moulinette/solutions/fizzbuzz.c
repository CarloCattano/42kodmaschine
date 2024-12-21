#include <unistd.h>

int is_prime(int n)
{
	if (n < 2)
		return (0);
	for (int i = 2; i*i <= n; i++)
	{
		if (n % i == 0)
			return (0);
	}
	return (1);
}

void fizzbuzz(int n)
{
	if (n < 1)
		return ;
	for (int i = 1; i <= n; i++)
	{
		if (is_prime(i) == 1)
			write(1, "Fizz\n", 5);
		else
			write(1, "Buzz\n", 5);
	}
}
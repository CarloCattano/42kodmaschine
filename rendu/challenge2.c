/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   challenge2.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: master.yoda <master@yoda.de>               +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/10/16 15:04:48 by marvin            #+#    #+#             */
/*   Updated: 2024/12/06 20:30:57 by master.yoda      ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>

/*
	Task: Write a function that prints the numbers from 1 to n.
	For numbers which are prime print “Fizz” and for those which are not prime
	print “Buzz”.
	Examples:
	- fizzbuzz(6) => Buzz, Fizz, Fizz, Buzz, Buzz, Fizz

	Allowed functions: write
*/

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
	// Your code here
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
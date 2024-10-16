
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   challenge1.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: marvin <no@way.zip>                         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/10/16 15:04:48 by marvin             #+#    #+#             */
/*   Updated: 2024/10/16 15:05:05 by carlo            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */
#include <unistd.h>

// exploit 1 alowed
// exploit 2 inline assembly allowed
// system("python3", "-c", "print('a')");

void print_a()
{
	write(1, "a\n", 2); 
//	write(1, "*\n", 2);
}

// do not submit your main.c
//int main() 
//{
//	print_a();
//}

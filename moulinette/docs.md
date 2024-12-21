# Challenge 1: print_a

Write a function that takes a string and prints the first character 'a'
it encounters in it followrd by a new line. If the string does not
contain any 'a' characters, the function shall display new line.

Illegal instructions:
- printf-family functions (e.g. dprintf, vprintf, printf, etc.)
- puts, fputs, putc, fputc, putchar

Level: easy

# Challenge 2: fizzbuzz

Write a function that takes an integer n and prints the numbers from 1
to n. For each number:
- If the number is prime, print "Fizz" followed by a comma and space.
- If the number is not prime, print "Buzz" followed by a comma and space.

Example:
- fizzbuzz(6) => Buzz, Fizz, Fizz, Buzz, Fizz, Buzz
                    1,    2,    3,    4,    5,    6

Illegal instructions:
- printf-family functions (e.g. dprintf, vprintf, printf, etc.)
- puts, fputs, putc, fputc, putchar

Level: easy

# Cahllenge 3: rot_n

Write a function that takes a string and displays it, replacing each
letter with the one that goes `n` letters after it in alphabetical
order.

Illegal instructions:
- printf-family functions (e.g. dprintf, vprintf, printf, etc.)
- puts, fputs, putc, fputc, putchar
- isalpha, isupper, islower, isdigit, strlen
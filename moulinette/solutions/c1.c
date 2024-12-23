#include <unistd.h>

void print_a(char *string)
{
  write(1, "a\n", 2);
}
#include <unistd.h>

void print_a(char *string);

int main(void) {
    print_a("a");
    print_a("aaaa");
    print_a("Not a");
    return (0);
}

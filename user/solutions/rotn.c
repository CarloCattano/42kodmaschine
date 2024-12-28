#include <unistd.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

void rot_n(const char *string, int n) {
    int i = 0;
    while (string[i] != '\0') {
        char char_to_encode = string[i];
        if (isalpha(char_to_encode)) {
            int offset = isupper(char_to_encode) ? 65 : 97;
            // Ensure n is in the range 0-25
            int normalized_n = ((n % 26) + 26) % 26;
            char encoded = (char)(((char_to_encode - offset + normalized_n) % 26) + offset);
            write(1, &encoded, 1);
        } else {
            write(1, &char_to_encode, 1);
        }
        i++;
    }
    write(1, "\n", 1);
}

/*/
int main(int argc, char *argv[]) {
    if (argc != 3) {
        printf("Usage: %s <string> <n>\n", argv[0]);
        return 1;
    }
    const char *input_string = argv[1];
    int n = atoi(argv[2]);
    rot_n(input_string, n);
    return 0;
}
*/
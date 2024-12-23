void rot_n(const char *string, int n);

int main(void) {
    char *string = "~~~ Welcome to 38C3! ~~~";
    for (int i = 0; i < 27; i++) {
        rot_n(string, i);
    }
    return (0);
}
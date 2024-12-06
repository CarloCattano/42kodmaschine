void fizzbuzz(int n);

int main(void) {
	for (int i = 1; i <= 100; i++) {
		fizzbuzz(i);
	}
	for (int i = -100; i <= 0; i++) {
		fizzbuzz(i);
	}
	return (0);
}
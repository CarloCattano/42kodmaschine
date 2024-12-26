#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>

static struct stat file_stat;

int main(int argc, char *argv[]) {
	if (argc != 4) {
		fprintf(stderr, "Usage: %s <file> <command> <sleep time>\n", argv[0]);
		exit(1);
	}
	if (stat(argv[1], &file_stat) == -1) {
		perror("stat");
		exit(1);
	}
	// Idealy add a flag for the command to be executed before watching the file
	// TODO
	system(argv[2]);
	while (1) {
		struct stat new_stat;
		if (stat(argv[1], &new_stat) == -1) {
			perror("stat");
			exit(1);
		}
		if (new_stat.st_mtime != file_stat.st_mtime) {
			// File has been modified
			file_stat = new_stat;
			system(argv[2]);
		}
		usleep(atof(argv[3]) * 1000);
	}
	return 0;
}
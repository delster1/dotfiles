#include <dirent.h>
#include <sys/wait.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
  if (argc < 2) {
    printf("Incorrect usage: please include configs to update.\n");
    return 0;
  }

  int exitcode = 0;

  for (int i = 1; i < argc; i++) {
    pid_t pid = fork();
    if (pid < 0) {
      perror("fork");
      exitcode = 1;
      continue;
    }

    if (pid == 0) {
      // child: exec stow -R <package>
      execlp("stow", "stow", "-R", argv[i], (char *)NULL);
      perror("execlp stow"); // only reached if exec fails
      _exit(127);
    } else {
      int status;
      if (waitpid(pid, &status, 0) < 0) {
        perror("waitpid");
        exitcode = 1;
        continue;
      }
      if (WIFEXITED(status) && WEXITSTATUS(status) == 0) {
        printf("✔ updated configs for %s\n", argv[i]);
      } else {
        fprintf(stderr, "✖ updating configs failed for %s (status=%d)\n", argv[i], status);
        exitcode = 1;
      }
    }
  }
  return exitcode;
}

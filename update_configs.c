#include <sys/wait.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Incorrect usage: please include configs to update.\n");
        fprintf(stderr, "Example: %s nvim zsh git\n", argv[0]);
        return 1;
    }

    const char *home = getenv("HOME");
    if (!home || strlen(home) == 0) {
        fprintf(stderr, "Error: HOME environment variable not set.\n");
        return 1;
    }

    char stow_dir[PATH_MAX];
    snprintf(stow_dir, sizeof(stow_dir), "%s/.dotfiles", home);

    int exitcode = 0;

    for (int i = 1; i < argc; i++) {
        pid_t pid = fork();
        if (pid < 0) {
            perror("fork");
            exitcode = 1;
            continue;
        }

        if (pid == 0) {
            execlp(
                "stow",
                "stow",
                "-d", stow_dir,   
                "-t", home,      
                "-R",
                argv[i],
                (char *)NULL
            );
            perror("execlp stow"); 
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
                fprintf(stderr,
                        "✖ updating configs failed for %s (status=%d)\n",
                        argv[i], status);
                exitcode = 1;
            }
        }
    }

    return exitcode;
}


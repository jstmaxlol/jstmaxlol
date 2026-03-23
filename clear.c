#include <stdio.h>
#include <clear.h>

int main(int argc, char **argv)
{
    if (argc >= 2) {
        char *grammar = (argc > 2)? "arguments" : "argument";
        printf("%d %s found. %s won't be checked.\n", argc-1, grammar, grammar);
        for (int i = 1; i < argc; i++) {
            printf("argument %d = %s\n", i, argv[i]);
        }
        printf("aborting insane clear operation.\n");
        return 1;
    }
    printf("%s", ANSI_CLEAR_SCREEN_AND_SCROLLBACK);
    return 0;
}

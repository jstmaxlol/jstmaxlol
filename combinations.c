#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

void swap(char *a, char *b);
void permute(char *s, int l, int r);
unsigned long long fact(int n);

const char red[] = "\033[31m";
const char white[] = "\033[37m";
const char norm[] = "\033[0m";

int main(int argc, char **argv) {
    if (argc != 2) {
        printf("%scmb%s>%s at least give me a string :(\n", red, white, norm);
        return 1;
    }
    
    char warn = 'n';
    char *str = strdup(argv[1]);
    
    unsigned long long iter_num = fact(strlen(str));

    printf("%scmb%s>%s iteration count: %ld! = %llu\n", red, white, norm, strlen(str), iter_num);
    
    if (strlen(str) >= 6) {
        printf("%scmb%s>%s warning, your string is %ld characters long.\n", red, white, norm, strlen(str));
        printf("%scmb%s>%s the output %s*will*%s be %shuge%s, continue? (y/n)\n? ", red, white, norm, red, norm, red, norm);
        scanf(" %c", &warn);
        if (warn == 'n') {
            printf("%scmb%s>%s quitting gracefully..\n", red, white, norm);
            free(str);
            return 1;
        }
    }

    printf("%scmb%s>%s ", red, white, norm); // without \n -> prints the given string, *wink* *wink* :)
    permute(str, 0, strlen(str) - 1);

    free(str);
    return 0;
}

void swap(char *a, char *b) {
    char tmp = *a;
    *a = *b;
    *b = tmp;
}

void permute(char *s, int l, int r) {
    if (l == r) {
        printf("%s\n", s);
        return;
    }

    for (int i = l; i <= r; i++) {
        swap(&s[l], &s[i]); 
        permute(s, l + 1, r);
        swap(&s[l], &s[i]); 
    }
}

unsigned long long fact(int n) {
    return (n <= 1) ? 1 : n * fact(n - 1);
}


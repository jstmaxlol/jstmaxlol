#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

void swap(char *a, char *b);
void permute(char *s, int l, int r);
unsigned long long fact(int n);
void usage();

const char red[] = "\033[31m";
const char white[] = "\033[37m";
const char norm[] = "\033[0m";
int colsize = 3;

int main(int argc, char **argv) {
    if (argc < 2) {
        printf("%scmb%s>%s at least give me a string :(\n", red, white, norm);
        return 1;
    }
    if (argc == 3) {
        if (strcmp(argv[2], "-h") == 0 || strcmp(argv[2], "--help") == 0) {
            usage();
            return 0;
        } else {
            if (atoi(argv[2]) > 9) {
                colsize = 9;
            } else if (atoi(argv[2]) < 1) {
                colsize = 1;
            } else {
                colsize = atoi(argv[2]);
            }
        }
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

    printf("%scmb%s>%s %s\n", red, white, norm, str); 
    permute(str, 0, strlen(str) - 1);
    printf("\n");

    free(str);
    return 0;
}

void swap(char *a, char *b) {
    char tmp = *a;
    *a = *b;
    *b = tmp;
}

void permute(char *s, int l, int r) {
    static unsigned long long count = 0;
    if (l == r) {
        printf("%s\t", s);
        count++;
        if (count % colsize == 0) printf("\n");
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

void usage() {
    // the most beautiful printf call you'll ever see <3
    printf(
        "%sC%so%sMB%sinations\n"
        "A simple utility that prints all the combinations of a given string.\n\n"
        "Syntax: %scmb%s string [%soptions%s]\n"
        "%sOptions%s:\n"
        "%s-h%s | %s--help%s : Prints this usage screen\n"
        "%s1%s-%s9%s : Specify coloumn size\n"
        , red, norm, red, norm
        , red, norm, red, norm
        , red, norm
        , red, norm, red, norm
        , red, norm, red, norm
    );
}

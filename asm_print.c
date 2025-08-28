#include <string.h>
#include <stddef.h>

#ifndef __stupid
#define __stupid

void dprint(const char* str);

int main(void) {
    const char* message = "Hello, World!";

    dprint(message);

    return 0;
}

void dprint(const char* str) {
    size_t len = strlen(str);

    asm volatile (
        "movq $1, %%rax;"
        "movq $1, %%rdi;"
        "movq %0, %%rsi;"
        "movq %1, %%rdx;"
        "syscall;"
        :
        : "r" (str), "r" (len)
        : "%rax", "%rdi", "%rsi", "%rdx"
    );
}

#endif

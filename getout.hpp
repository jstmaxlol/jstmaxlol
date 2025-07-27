// getout.hpp - a minimal, colorful, chainable, type-safe print system that doesn't utilize the C++ STL.

#ifndef GETOUT_HPP
#define GETOUT_HPP

#include <cstdio>
#include <cstddef>
#include <cstdint>
#include <cstdio>

struct GetOut {
    void write(const char* data, size_t len) {
        fwrite(data, 1, len, stdout);
    }
    void write(const char* str) {
        while (*str) putchar(*str++);
    }

    // print C-string
    GetOut& operator<<(const char* str) {
        write(str);
        return *this;
    }

    //print single char
    GetOut& operator<<(char c) {
        putchar(c);
        return *this;
    }

    // print signed int
    GetOut& operator<<(int x) {
        if (x == 0) {
            putchar('0');
            return *this;
        }
        if (x < 0) {
            putchar('-');
            x = -x;
        }
        char buf[20];
        int i = 0;
        while (x > 0) {
            buf[i++] = '0' + (x % 10);
            x /= 10;
        }
        for (int j = i - 1; j >= 0; --j)
            putchar(buf[j]);
        return *this;
    }

    // print unsigned int
    GetOut& operator<<(unsigned x) {
        if (x == 0) {
            putchar('0');
            return *this;
        }
        char buf[20];
        int i = 0;
        while (x > 0) {
            buf[i++] = '0' + (x % 10);
            x /= 10;
        }
        for (int j = i - 1; j >= 0; --j)
            putchar(buf[j]);
        return *this;
    }

    // print bool
    GetOut& operator<<(bool b) {
        return *this << (b ? "true" : "false");
    }

    // print double (thanks snprintf lol)
    GetOut& operator<<(double d) {
        char buf[64];
        int len = snprintf(buf, sizeof(buf), "%f", d);
        write(buf, len);
        return *this;
    }

    // print pointer as hex
    GetOut& operator<<(const void* p) {
        char buf[2 + sizeof(uintptr_t)*2 + 1]; // "0x" + digits + null
        uintptr_t addr = reinterpret_cast<uintptr_t>(p);
        const char* hex = "0123456789abcdef";

        buf[0] = '0';
        buf[1] = 'x';
        for (int i = (int)(sizeof(uintptr_t) * 2) - 1; i >= 0; --i) {
            buf[2 + i] = hex[addr & 0xF];
            addr >>= 4;
        }
        buf[2 + sizeof(uintptr_t)*2] = '\0';
        write(buf, 2 + sizeof(uintptr_t)*2);
        return *this;
    }
};

// ANSI color strings // escape.ansi.sux
constexpr const char* red     = "\033[31m";
constexpr const char* green   = "\033[32m";
constexpr const char* yellow  = "\033[33m";
constexpr const char* blue    = "\033[34m";
constexpr const char* magenta = "\033[35m";
constexpr const char* cyan    = "\033[36m";
constexpr const char* reset   = "\033[0m";

// newline manipulator - the better std::endl lol
struct En {};
inline En en;
inline GetOut& operator<<(GetOut& go, En) {
    return go << '\n';
}

// global instance
inline GetOut go;

#endif // GETOUT_HPP

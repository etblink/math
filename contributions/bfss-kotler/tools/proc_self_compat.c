#define _GNU_SOURCE
#include <dlfcn.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

/* Optional host compatibility only: redirect this process's executable alias.
 * No file content, compiler options, imports or proof inputs are changed.
 * Build with: cc -shared -fPIC proc_self_compat.c -ldl -o /tmp/proc_self_compat.so
 */
ssize_t readlink(const char *path, char *buf, size_t size) {
    static ssize_t (*original)(const char *, char *, size_t);
    if (!original) original = dlsym(RTLD_NEXT, "readlink");
    char own_exe[80];
    snprintf(own_exe, sizeof own_exe, "/proc/%d/exe", (int)getpid());
    return original(strcmp(path, own_exe) == 0 ? "/proc/self/exe" : path, buf, size);
}

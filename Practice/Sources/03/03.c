#include <unistd.h>
#include <sys/syscall.h>

static const char message[] = "hello, world\n";

int main()
{
    syscall(SYS_write, STDOUT_FILENO, message, sizeof(message) - 1);

    return 0;
}


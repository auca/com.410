#include <stdio.h>

static const char *input_format  = "%ld";
static const char *output_format = "%ld\n";

static long fib_recursive(long n, long a, long b)
{
    return --n > 0 ? fib_recursive(n, b, a + b) : a;
}

static long fib_loop(long n, long a, long b)
{
    while (--n > 0) {
        long temp = a + b;
        a = b;
        b = temp;
    }

    return a;
}

int main()
{
    long n;
    scanf(input_format, &n);

    printf(output_format, fib_recursive(n, 0, 1));
    printf(output_format, fib_loop(n, 0, 1));

    return 0;
}


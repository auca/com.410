#include <stdio.h>

static const char *input_format  = "%ld";
static const char *output_format = "%ld\n";

static long factorial_recursive(long n)
{
    return n == 0 ? 1 : n * factorial_recursive(n - 1);
}

static long factorial_loop(long n)
{
    long result = 1;
    for (long i = 2; i <= n; ++i) {
        result *= i;
    }

    return result;
}

int main()
{
    long n;
    scanf(input_format, &n);

    printf(output_format, factorial_recursive(n));
    printf(output_format, factorial_loop(n));

    return 0;
}


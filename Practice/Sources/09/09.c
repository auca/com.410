#include <stdio.h>

static const char *input_format  = "%ld %ld";
static const char *output_format = "%ld\n";

static long gcd_recursive(long a, long b)
{
    return b == 0 ? a : gcd_recursive(b, a % b);
}

static long gcd_loop(long a, long b)
{
    while (b != 0) {
        long temp = a % b;
        a = b;
        b = temp;
    }

    return a;
}

int main()
{
    long a, b;
    scanf(input_format, &a, &b);

    printf(output_format, gcd_recursive(a, b));
    printf(output_format, gcd_loop(a, b));

    return 0;
}


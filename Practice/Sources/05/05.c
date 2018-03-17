#include <stdio.h>

static const char *input_format  = "%ld %ld";
static const char *output_format = "%ld + %ld = %ld\n";

static long a = 0;
static long b = 0;

int main()
{
    scanf(input_format, &a, &b);
    long sum = a + b;
    printf(output_format, a, b, sum);

    return 0;
}


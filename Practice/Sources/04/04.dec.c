#include <stdio.h>

static const char *input_format  = "%ld";
static const char *output_format = "%ld\n";

static long number = 0;

int main()
{
    scanf(input_format, &number);
    --number;
    printf(output_format, number);

    return 0;
}


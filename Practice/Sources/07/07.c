#include <stdio.h>

static const char *input_format  = "%ld %ld";
static const char *output_format = "%ld is the greatest number.\n";
static const char *equal_message = "Both numbers are equal.";

static long a = 0;
static long b = 0;

int main()
{
    scanf(input_format, &a, &b);

    if (a > b) {
        printf(output_format, a);
    } else if (a < b) {
        printf(output_format, b);
    } else {
        puts(equal_message);
    }

    return 0;
}


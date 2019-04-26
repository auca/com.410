#include <stdio.h>

int main()
{
    #define INPUT_LENGTH 30

    static double input[] = {
        1,  2,  3,  4,  5,  6,  7,  8,  9,  10,
        11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
        21, 22, 23, 24, 25, 26, 27, 28, 29, 30
    };

    long a, b;
    scanf("%ld %ld", &a, &b);

    for (unsigned long i = 0; i < INPUT_LENGTH; ++i) {
        input[i] = input[i] * a + b;
    }

    for (unsigned long i = 0; i < INPUT_LENGTH; ++i) {
        printf("%f ", input[i]);
    }

    return 0;
}

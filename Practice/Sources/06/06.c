#include <stdio.h>

static const char *output_format = "%ld\n";

static long add1(int a)
{
    return (long) a;
}

static long add2(int a, int b)
{
    return (long) a + (long) b;
}

static long add3(int a, int b, int c)
{
    return a + b + c;
}

static long add4(int a, int b, int c, int d)
{
    return a + b + c + d;
}

static long add5(int a, int b, int c, int d, int e)
{
    return a + b + c + d + e;
}

static long add6(int a, int b, int c, int d, int e, int f)
{
    return a + b + c + d + e + f;
}

static long add7(int a, int b, int c, int d, int e, int f, int g)
{
    return a + b + c + d + e + f + g;
}

static long add8(int a, int b, int c, int d, int e, int f, int g, int h)
{
    return a + b + c + d + e + f + g + h;
}

static long add9(int a, int b, int c, int d, int e, int f, int g, int h, int i)
{
    return a + b + c + d + e + f + g + h + i;
}

static long add10(int a, int b, int c, int d, int e, int f, int g, int h, int i, int j)
{
    return a + b + c + d + e + f + g + h + i + j;
}

int main()
{
    printf(output_format, add1(1));
    printf(output_format, add2(1, 2));
    printf(output_format, add3(1, 2, 3));
    printf(output_format, add4(1, 2, 3, 4));
    printf(output_format, add5(1, 2, 3, 4, 5));
    printf(output_format, add6(1, 2, 3, 4, 5, 6));
    printf(output_format, add7(1, 2, 3, 4, 5, 6, 7));
    printf(output_format, add8(1, 2, 3, 4, 5, 6, 7, 8));
    printf(output_format, add9(1, 2, 3, 4, 5, 6, 7, 8, 9));
    printf(output_format, add10(1, 2, 3, 4, 5, 6, 7, 8, 9, 10));

    return 0;
}


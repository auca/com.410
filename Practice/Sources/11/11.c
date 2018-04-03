#include <stdio.h>

unsigned long get_day_in_month_if(unsigned long year, unsigned long month)
{
    unsigned long days;

    if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
        days = 31;
    } else if (month == 4 || month == 6 || month == 9 || month == 11) {
        days = 30;
    } else if (month == 2) {
        if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) {
            days = 29;
        } else {
            days = 28;
        }
    } else {
        days = -1;
    }

    return days;
}

unsigned long get_day_in_month_case(unsigned long year, unsigned long month)
{
    unsigned long days;

    switch (month) {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            days = 31;
            break;
        case 4:
        case 6:
        case 9:
        case 11:
            days = 30;
            break;
        case 2:
            if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) {
                days = 29;
            } else {
                days = 28;
            }
        default:
            days = -1;
    }

    return days;
}

unsigned long get_day_in_month_array(unsigned long year, unsigned long month)
{
    static const unsigned long days_lookup_table[] = {
        31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
     // 1   2   3   4   5   6   7   8   9   10  11  12
     // 0   1   2   3   4   5   6   7   8   9   10  11
    };

    unsigned long days = -1;

    if (month >= 1 && month <= 12) {
        days = days_lookup_table[month - 1];
        if (month == 2) {
            if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) {
                days = 29;
            }
        }
    }

    return days;
}

int main()
{
    unsigned long year, month;
    scanf("%lu %lu", &year, &month);

    printf("%lu\n", get_day_in_month_if(year, month));
    printf("%lu\n", get_day_in_month_case(year, month));
    printf("%lu\n", get_day_in_month_array(year, month));

    return 0;
}


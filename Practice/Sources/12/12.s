.section .data

# const char *input_format = "%ld %ld";
input_format:
    .string "%ld %ld"
# const char *output_format = "%ld\n";
output_format:
    .string "%ld\n"
# const long days_lookup_table[] = { ...
days_lookup_table:
    .quad 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31

.section .text

# long get_day_in_month(long year, long month)
get_day_in_month:
    # long days = -1;
    mov $-1, %rcx

    # if (month >= 1 && month <= 12) {
    cmp $1, %rsi
    jl .get_day_in_month.end
    cmp $12, %rsi
    jg .get_day_in_month.end

    # days = days_lookup_table[month - 1];
    lea days_lookup_table(%rip), %rdx
    mov -0x8(%rdx, %rsi, 0x8), %rcx

    # if (month == 2) {
    cmp $2, %rsi
    jne .get_day_in_month.end

    # if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) {
    # year % 4 == 0
    mov %rdi, %rax
    cqo
    mov $4, %r8
    div %r8
    test %rdx, %rdx
    jne .get_day_in_month.or_year_divisable_by_400

    # ... && year % 100 != 0
    mov %rdi, %rax
    cqo
    mov $100, %r8
    div %r8
    test %rdx, %rdx
    je .get_day_in_month.or_year_divisable_by_400

    jmp .get_day_in_month.is_leap

.get_day_in_month.or_year_divisable_by_400:
    # ... || year % 400 == 0
    mov %rdi, %rax
    cqo
    mov $400, %r8
    div %r8
    test %rdx, %rdx
    jne .get_day_in_month.end

.get_day_in_month.is_leap:
    # days = 29;
    mov $29, %rcx

.get_day_in_month.end:
    # return days;
    mov %rcx, %rax
    ret

# int main() { ...
.global main
main:
    # long year, month;
    sub $0x10, %rsp # Allocate the data on the stack for the local variables as
                    # we need their addresses for the `scanf` function. We can't
                    # get the address of a register.

    # scanf("%ld %ld", &year, &month);
    lea input_format(%rip), %rdi
    lea 0x8(%rsp), %rsi
    lea (%rsp), %rdx
    xor %eax, %eax
    call scanf@plt

    # printf("%ld\n", get_day_in_month(year, month));
    mov 0x8(%rsp), %rdi
    mov (%rsp), %rsi
    call get_day_in_month
    mov %rax, %rsi
    lea output_format(%rip), %rdi
    xor %eax, %eax
    call printf@plt

    add $0x10, %rsp # Remove the local variables `year` and `month` from the stack.

    # return 0;
    xor %eax, %eax
    ret


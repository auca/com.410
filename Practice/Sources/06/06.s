.section .data

# static const char *output_format = "%ld\n";
output_format:
    .string "%ld\n"

.section .text

# static long add1(int a) { ...
add1:
    # zero extension
    # 00000001: (1) char
    # 0000000000000001: (1) short

    # sign extension
    # 10000001: (-1) char in ones' complement mode
    # 11111111: (-1) char in two's complement mode
    # 0000000011111111: (FF) short with zero extension
    # 1111111111111111: (-1) short with sign extension

    # Zero extension will work only with unsigned numbers
    # rdi: [^7&*&*(&(|         ]
    # rax: [^&^&*^&*^|&*^&%^&%^]
    # xor %rax, %rax
    # rax: [000...000|000...000]
    # mov %edi, %eax
    # rax: [000...000|000...001]

    mov %edi, %eax
    cltq # sign extend eax -> rax, int -> long
    ret

# static long add2(int a, int b) { ...
add2:
    mov %edi, %eax
    cltq
    mov %rax, %rdi
    mov %esi, %eax
    cltq
    add %rdi, %rax
    ret

# add3...add5

# static long add6(int a, int b, int c, int d, int e, int f) { ...
add6:
    mov %edi, %eax
    cltq
    mov %rax, %rdi

    mov %esi, %eax
    cltq
    mov %rax, %rsi

    mov %edx, %eax
    cltq
    mov %rax, %rdx

    mov %ecx, %eax
    cltq
    mov %rax, %rcx

    mov %r8d, %eax
    cltq
    mov %rax, %r8

    mov %r9d, %eax
    cltq

    add %rdi, %rax
    add %rsi, %rax
    add %rdx, %rax
    add %rcx, %rax
    add %r8,  %rax

    ret

# static long add7(int a, int b, int c, int d, int e, int f, int i) { ...
add7:
    mov %edi, %eax
    cltq
    mov %rax, %rdi

    mov %esi, %eax
    cltq
    mov %rax, %rsi

    mov %edx, %eax
    cltq
    mov %rax, %rdx

    mov %ecx, %eax
    cltq
    mov %rax, %rcx

    mov %r8d, %eax
    cltq
    mov %rax, %r8

    mov %r9d, %eax
    cltq
    mov %rax, %r9

    add %rdi, %rax
    add %rsi, %rax
    add %rdx, %rax
    add %rcx, %rax
    add %r8,  %rax
    pop %rdx       # return address
    pop %rdi       # 7
    add %rdi, %rax
    push %rdx      # put the return address back

    ret

# add8...add10

# int main() { ...
.global main
main:
    # printf(output_format, add1(1));
    mov $1, %edi
    call add1
    lea output_format(%rip), %rdi
    mov %rax, %rsi
    xor %eax, %eax
    call printf@plt

    # printf(output_format, add2(1, 2));
    mov $1, %edi
    mov $2, %esi
    call add2
    lea output_format(%rip), %rdi
    mov %rax, %rsi
    xor %eax, %eax
    call printf@plt

    # add3...add5
    # ...

    # printf(output_format, add6(1, 2, 3, 4, 5, 6));
    mov $1, %edi
    mov $2, %esi
    mov $3, %edx
    mov $4, %ecx
    mov $5, %r8d
    mov $6, %r9d
    call add6
    lea output_format(%rip), %rdi
    mov %rax, %rsi
    xor %eax, %eax
    call printf@plt

    # printf(output_format, add7(1, 2, 3, 4, 5, 6, 7));
    mov $1, %edi
    mov $2, %esi
    mov $3, %edx
    mov $4, %ecx
    mov $5, %r8d
    mov $6, %r9d
    push $7
    call add7 # also pushes the return address
    lea output_format(%rip), %rdi
    mov %rax, %rsi
    xor %eax, %eax
    call printf@plt

    # add8...add10
    # ...

    # return 0;
    xor %eax, %eax
    ret


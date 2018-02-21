.section .data
output_format:
    .string "%ld\n"

.section .text
.global main
add1:
    # zero extension
    # 00000001: (1) char
    # 0000000000000001: (1) short
    # sign extension
    # 11111111: (-1) char
    # 1111111111111111: (-1) short

    # will work only with unsigned numbers
    # rdi: [^7&*&*(&(|         ]
    # rax: [^&^&*^&*^|&*^&%^&%^]
    # xor %rax, %rax
    # rax: [000...000|000...000]
    # mov %edi, %eax
    # rax: [000...000|000...001]
    #...main
    # mov %rax, %rsi

    mov %edi, %eax
    cltq # sign extend eax -> rax
    ret

add2:
    mov %edi, %eax
    cltq
    mov %rax, %rdi
    mov %esi, %eax
    cltq
              # esi extended to 64-bits
    add %rdi, %rax
    ret

# add3-add5

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

              # r9d sign extended to 64-bit
    add %rdi, %rax
    add %rsi, %rax
    add %rdx, %rax
    add %rcx, %rax
    add %r8,  %rax

    ret

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
    add %r9,  %rax
    pop %rdx # return address
    pop %rdi # 7
    add %rdi, %rax
    push %rdx

    ret # pop return address to rip

main:
    mov $1, %edi
    call add1

    lea output_format(%rip), %rdi
    mov %rax, %rsi
    xor %eax, %eax
    call printf@plt

    mov $1, %edi
    mov $2, %esi
    call add2

    lea output_format(%rip), %rdi
    mov %rax, %rsi
    xor %eax, %eax
    call printf@plt

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

    mov $1, %edi
    mov $2, %esi
    mov $3, %edx
    mov $4, %ecx
    mov $5, %r8d
    mov $6, %r9d
    push $7
    call add7 # push $return_address

    lea output_format(%rip), %rdi
    mov %rax, %rsi
    xor %eax, %eax
    call printf@plt

    xor %eax, %eax
    ret


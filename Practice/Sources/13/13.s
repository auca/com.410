.section .data

input_format:
    .string "%ld %ld"
output_format:
    .string "%ld "

input:
    .quad 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30

.section .text
.global main
main:
    push %rbp
    mov %rsp, %rbp

    sub $16, %rsp

    lea input_format(%rip), %rdi
    lea 8(%rsp), %rsi # a
    lea (%rsp), %rdx  # b
    xor %eax, %eax
    call scanf@plt

    mov 8(%rsp), %r9     # a
    mov (%rsp), %r10     # b
    lea input(%rip), %r8 # base
    xor %rcx, %rcx       # index
.main.for1.start:
    cmp $30, %rcx
    jae .main.for1.end

    # input[i] = input[i] * a + b;
    mov (%r8, %rcx, 8), %rax
    imul %r9, %rax
    add %r10, %rax
    mov %rax, (%r8, %rcx, 8)

    inc %rcx
    jmp .main.for1.start
.main.for1.end:

    xor %rcx, %rcx # index
.main.for2.start:
    cmp $30, %rcx
    jae .main.for2.end

    add $16, %rsp
    mov %rcx, (%rsp)

    lea output_format(%rip), %rdi
    lea input(%rip), %r8 # base
    mov (%r8, %rcx, 8), %rsi
    xor %eax, %eax
    call printf@plt

    mov (%rsp), %rcx
    sub $16, %rsp

    inc %rcx
    jmp .main.for2.start
.main.for2.end:

    leave

    xor %eax, %eax
    ret


.intel_syntax noprefix

.section .data

# static const char *message = "hello, world";
message:
    .string "hello, world"

.section .text

# int main() { ...
.global main
main:
    # puts(message);

    # Refer to pages 27-28 of the Optimization Guide
    # for information about the ABI of the 64-bit Linux
    # kernel.
    lea rdi, [rip+message] # lea is somewhat equivalent to the & operator in C
    call puts@plt          # @plt is a special jump table to allow PIC ASLR code.

    # return 0;
    xor eax, eax
    ret


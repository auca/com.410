# Assemble and link with `gcc -m32 -o 02.32 02` to get a 32-bit executable.

.section .data

# static const char *message = "hello, world";
message:
    .string "hello, world"

.section .text

# int main() { ...
.global main
main:
    # puts(message);

    # On a 32-bit x86 architecture arguments
    # are passed through the stack in the opposite
    # order and on the most recent platforms with
    # PIC, PIE and ASLR support you need to do a
    # lot of additional prep. work to know where to
    # jump.
    call __x86.get_pc_thunk.bx
    add $_GLOBAL_OFFSET_TABLE_, %ebx
    lea message@GOTOFF(%ebx), %eax
    push %eax
    call puts@plt
    add $0x4, %esp # removes the message from the stack (think why is `add` is
                   # better than `pop` in this particular case)

    # return 0;
    xor %eax, %eax
    ret


.section .data

# static const char *message = "hello, world\n";
message:
    .string "hello, world\n"
    message_size = .-message # calculates the size in bytes as a
                             # difference between the current address (.)
                             # and the address of the label `message`.

.section .text

# int main() { ...
.global main
main:
    # write(1, message, 13); # Write 13 characters from the buffer `message`
                             # to STDOUT.

    # Refer to `man syscall`, `man syscalls`, `man 2 write` documentation.
    mov $0x1, %rax               # the write system call has the identification number 1 (https://github.com/torvalds/linux/blob/master/arch/x86/entry/syscalls/syscall_64.tbl)
    mov $0x1, %rdi               # STDOUT file descriptor is always 1
    lea message(%rip), %rsi      # lea is somewhat equivalent to the & operator in C
    mov $message_size, %rdx      # the size of the `message` buffer
    syscall                      # calls the OS kernel directly without
                                 #   the help of the C standard library.

    # return 0;
    xor %eax, %eax
    ret


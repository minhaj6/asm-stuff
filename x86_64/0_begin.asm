.global _start
.intel_syntax noprefix

_start:
    # write syscall
    mov rax, 1
    mov rdi, 1   # stdout file descriptor
    lea rsi, [hello_world]
    mov rdx, 19
    syscall


    # exit syscall
    mov rax, 60
    mov rdi, 69  # return code
    syscall

hello_world:
    .asciz "Hello cruel world\n"

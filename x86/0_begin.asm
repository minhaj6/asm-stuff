# 32bit x86 assembly 
# https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md#x86-32_bit

.global _start
.intel_syntax
.section .text
_start:
    # write to stdout
    mov %eax, 4     # write syscall
    mov %ebx, 1     # stdout
    lea %ecx, [msg]
    mov %edx, 19
    int 0x80

    # exit syscall
    mov %eax, 1
    mov %ebx, 65
    int 0x80

.section .data
    msg:
    .ascii "Hello cruel world\n"

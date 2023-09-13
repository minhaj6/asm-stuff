# 1: Push string in the stack, write it to STDOUT
# Write string to memory and write to STDOUT

.global _start
.intel_syntax
.section .text
_start:
    # 1: push to stack and print it
    push 0x0a434241     # ABC\n ascii
    mov %eax, 4         # write syscall
    mov %ebx, 1         # stdout file descriptor
    mov %ecx, %esp      # esp points to top of the stack
    mov %edx, 4         # length of the string "ABC\n"
    int 0x80

    # 2: Write it memory and print it 
    mov dword ptr [%esp], 0x0a464544    # mov DEF\n to location
                                        # pointed by %esp
    mov %eax, 4         # write syscall
    mov %ebx, 1         # stdout file descriptor
    mov %ecx, %esp      # esp points to top of the stack
    mov %edx, 4         # length of the string "ABC\n"
    int 0x80

    # exit syscall
    mov %eax, 1
    mov %ebx, 65        # random return
    int 0x80


.section .data
    msg:

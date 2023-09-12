# playing with arm assembly

.global _start
.section .text

_start:
    mov r7, #0x4        @ 0x4 denotes "write" function call
    mov r0, #1          @ arg0, file descriptor is STDOUT
    ldr r1, =message
    mov r2, #19         @ size of the buffer
    swi 0

    # exist the program
    mov r7, #0x1
    mov r0, #65     @ some random return code
    swi 0

.section .data
    message:
    .ascii "Hello cruel world\n"

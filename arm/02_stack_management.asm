.global _start
.section .text

_start:
    bl hello_world
    bl exit

hello_world:
    push {r4-r11, lr}   @ push regs to stack
    mov fp, sp          @ bring up the frame pointer
    sub sp, sp, #0x40   @ make room for 64byte in stack
    ldr r1, =#0x1337
    str r1, [fp, #-0x10] @ store random local variable in stack

    mov r7, #0x4        @ 0x4 denotes "write" function call
    mov r0, #1          @ arg0, file descriptor is STDOUT
    ldr r1, =message
    mov r2, #19         @ size of the buffer
    swi 0

    mov sp, fp
    pop {r4-r11, pc}    @ restore the stack

exit:
    push {fp, lr}

    mov r7, #0x1
    mov r0, #65     @ some random return code
    swi 0

    pop {fp, pc}

.section .data
    message:
    .ascii "Hello cruel world\n"

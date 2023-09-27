.global _start
.section .text

_start:

hello_world:
    mov r7, #0x4        @ 0x4 denotes "write" function call
    mov r0, #1          @ arg0, file descriptor is STDOUT
    ldr r1, =message
    mov r2, #19         @ size of the buffer
    swi 0

jump_to_thumb_code:
    ldr r0, =#hello_world_thumb
    add r0, r0, #1
    bx r0

.thumb
hello_world_thumb:
    mov r7, #0x4        @ 0x4 denotes "write" function call
    mov r0, #1          @ arg0, file descriptor is STDOUT
    ldr r1, =message
    mov r2, #19         @ size of the buffer
    swi 0

jump_to_arm_code:
    ldr r0, =#exit
    bx r0
.arm

exit:
    # exist the program
    mov r7, #0x1
    mov r0, #65     @ some random return code
    swi 0

.section .data
    message:
    .ascii "Hello cruel world\n"

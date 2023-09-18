.global _start
.section .text

_start:
    mov x15, #15
    
loop:
    cmp x15, #0
    beq exit

    bl write

    sub x15, x15, #1
    b loop

write:
    # write to stdout
    mov x8, #64
    mov x0, #1
    ldr x1, =msg
    mov x2, #19
    svc 0

    ret


exit:
    # exit syscall
    mov x8, #0x5d
    mov x0, #0x41
    svc 0

.section .data
    msg:
    .ascii "Hello cruel world\n"

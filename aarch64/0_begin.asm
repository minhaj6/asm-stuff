# syscall table - https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md#arm64-64_bit

.global _start
.section .text

_start:
    # write to stdout
    mov x8, #0x40   // syscall for write
    mov x0, #1      // stdout
    ldr x1, =msg    // buffer label
    mov x2, #19     // buffer length
    svc 0


    # program exit
    mov x8, #0x5d   // syscall for exit
    mov x0, #0x41   // random error code
    svc 0           // call the syscall

.section .data
    msg:
    .ascii "Hello cruel world\n"

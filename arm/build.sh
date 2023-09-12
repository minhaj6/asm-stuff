arm-none-eabi-as 00_begin.asm -o begin.o
arm-none-eabi-gcc begin.o -o begin.elf -nostdlib
qemu-arm begin.elf

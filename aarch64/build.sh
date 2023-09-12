# assemble to object 
aarch64-linux-gnu-as 0_begin.asm -o 0_begin.o

# relocatable object to elf
aarch64-linux-gnu-gcc 0_begin.o -o 0_begin.elf -nostdlib -static

# emulate in qemu user mode
qemu-aarch64 ./0_begin.elf

# the returned value 
echo $?

as 0_begin.asm --32 -o 0_begin.o
gcc -m32 0_begin.o -o 0_begin.elf -nostdlib
./0_begin.elf
echo $?


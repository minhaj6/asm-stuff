#!/usr/bin/env bash

# just the name of asm file without .asm

if [ -z $1 ]; then
    echo "No argument provided"
    echo "just the name of asm file without .asm"
elif [ $1 == "rm" ]; then
    rm *.elf *.o
else
    aarch64-linux-gnu-as $1.asm -o $1.o
    aarch64-linux-gnu-gcc $1.o -o $1.elf -nostdlib -static
    qemu-aarch64 ./$1.elf
    echo $?
fi


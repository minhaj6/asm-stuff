#!/usr/bin/env bash

# just the name of asm file without .asm

if [ -z $1 ]; then
    echo "No argument provided"
    echo "just the name of asm file without .asm"
elif [ $1 == "rm" ]; then
    rm *.elf *.o *.core
else
    arm-none-eabi-as $1.asm -o $1.o
    arm-none-eabi-gcc $1.o -o $1.elf -nostdlib
    qemu-arm ./$1.elf
    echo $?
fi


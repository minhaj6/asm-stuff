assemble to relocatable object
```
arm-none-eabi-as 00_begin.asm -o 00_begin.o
```

take the object and make elf
```
arm-none-eabi-gcc 00_begin.o -o 00_begin.elf -nostdlib
```

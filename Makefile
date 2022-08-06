CFLAGS=-std=c99 -Wall -g3 -O0 -Og -I. -mfloat-abi=soft -mtune=cortex-m4 -mcpu=cortex-m4 -mthumb -gdwarf-2 

all: f.elf

main.o: main.c Makefile
	arm-none-eabi-gcc -c main.c ${CFLAGS} 

startup.o: startup.c Makefile
	arm-none-eabi-gcc -c startup.c ${CFLAGS} 

f.elf: startup.o main.o Makefile linker_script.ld
	arm-none-eabi-gcc -o f.elf main.o startup.o -specs=nosys.specs -T linker_script.ld -nostartfiles ${CFLAGS} 
	arm-none-eabi-objdump -D f.elf > f.elf.dump
	arm-none-eabi-objcopy -j .text -j .data -O ihex f.elf f.hex


	
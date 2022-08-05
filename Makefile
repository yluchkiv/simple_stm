all: f.elf

main.o: main.c Makefile
	arm-none-eabi-gcc -c main.c -mfloat-abi=soft -mtune=cortex-m4 -mcpu=cortex-m4 -mthumb

startup.o: startup.c Makefile
	arm-none-eabi-gcc -c startup.c -mfloat-abi=soft -mtune=cortex-m4 -mcpu=cortex-m4 -mthumb

f.elf: startup.o main.o Makefile

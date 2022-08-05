all: f.elf

main.o: main.c Makefile
	arm-none-eabi-gcc -c main.c -mfloat-abi=soft -mtune=cortex-m4 -mcpu=cortex-m4 -mthumb

startup.o: startup.c Makefile
	arm-none-eabi-gcc -c startup.c -mfloat-abi=soft -mtune=cortex-m4 -mcpu=cortex-m4 -mthumb

f.elf: startup.o main.o Makefile linker_script.ld
	arm-none-eabi-gcc -o f.elf main.o startup.o -specs=nosys.specs -T linker_script.ld -nostartfiles
	arm-none-eabi-objdump -D f.elf > f.elf.S
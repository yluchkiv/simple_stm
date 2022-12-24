CC_FLAGS=-std=c99 -Wall -O0 -Og -g3 -iquote ./ -I ./ -I ./STM32CubeF3/Drivers/CMSIS/Device/ST/STM32F3xx/Include/\
 -I ./STM32CubeF3/Drivers/CMSIS/Core/Include/ -mfloat-abi=soft -mcpu=cortex-m4 -mthumb -gdwarf-2 -D=STM32F303xE

all: f.elf

main.o: main.c Makefile
	arm-none-eabi-gcc -c main.c ${CC_FLAGS}

startup.o: startup.c Makefile
	arm-none-eabi-gcc -c startup.c ${CC_FLAGS}

f.elf: startup.o main.o Makefile linker_script.ld
	arm-none-eabi-gcc -o f.elf main.o startup.o -specs=nosys.specs -T linker_script.ld -nostartfiles ${CC_FLAGS}
	arm-none-eabi-objdump -D f.elf > f.elf.dump
	arm-none-eabi-objcopy -O ihex $@ f.elf.ihex
	arm-none-eabi-objcopy -O srec $@ f.elf.srec
	arm-none-eabi-size $@

.PHONY: clean
clean:
	-rm ./*.o ./*.elf ./*.ihex ./*.dump ./*.srec

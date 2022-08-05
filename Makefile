main.o: main.c Makefile
	arm-none-eabi-gcc -c main.c -mfloat-abi=soft -mtune=cortex-m4 -mcpu=cortex-m4 -mthumb

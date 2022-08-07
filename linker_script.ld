MEMORY
{
	FLASH (rx)	: ORIGIN = 0x08000000, LENGTH = 512K
	RAM (rwx)	: ORIGIN = 0x20000000, LENGTH = 64K
}
_initial_sp = ORIGIN(RAM ) + LENGTH(RAM);

SECTIONS
{
    .vector_table :
    {
        . = ALIGN(4);
		KEEP(*(.vector_table))
        . = ALIGN(4);
    } > FLASH

    .text :
    {
        . = ALIGN(4);
        *(.text)
        *(.text*)
        . = ALIGN(4);
    } > FLASH

    .rodata :
    {
        . = ALIGN(4);
        *(.rodata)
        *(.rodata*)
        . = ALIGN(4);
    } > FLASH

    .data :
    {
        . = ALIGN(4);
        *(.data)
        *(.data*)
        . = ALIGN(4);
    } > RAM AT > FLASH
    _data_flash = LOADADDR(.data);
    _data_ram = ADDR(.data);
    _data_size = SIZEOF(.data);

    .bss :
    {
        . = ALIGN(4);
        *(.bss)
        *(.bss*)
        . = ALIGN(4);
    } > RAM
    _bss_ram =  ADDR(.bss);
    _bss_size = SIZEOF(.bss);
}

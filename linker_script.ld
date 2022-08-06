MEMORY
{
	FLASH (rx)	: ORIGIN = 0x08000000, LENGTH = 512K
	RAM (rwx)	: ORIGIN = 0x20000000, LENGTH = 64K
}

SECTIONS
{
    .vector :
    {
        . = ALIGN(4);
		KEEP(*(.vector))
        . = ALIGN(4);
    } > FLASH

    .text :
    {
        *(.text*)
    } > FLASH

    .data :
    {
        *(.data*)
    } > RAM AT > FLASH

    _data_flash = LOADADDR(.data);
    _data_ram = ADDR(.data);
    _data_size = SIZEOF(.data);

    .bss :
    {
        *(.bss*)
    } > RAM

    _bss_ram =  ADDR(.bss);
    _bss_size = SIZEOF(.bss);

    .rodata :
    {
        *(.rodata*)
    } > FLASH

}
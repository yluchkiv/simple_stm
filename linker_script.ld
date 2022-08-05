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

}
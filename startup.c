#include <stdint.h>

int main();

void reset(void)
{
    main();
    while(1)
    {

    }
}
 __attribute__((section(".vector"))) const uint32_t vercotr_table[128] = {
    0x20010000,
    (uint32_t)&reset

 };

#include <stdint.h>

int main();

void reset(void)
{
    main();
    while(1)
    {

    }
}

 void nmi(void)
 {
    while(1)
    {

    }
 }

 void hardfault(void)
 {
    while(1)
    {

    }
 }
 
  __attribute__((section(".vector"))) const uint32_t vercotr_table[128] = {
    0x20010000,
    (uint32_t)&reset,
    (uint32_t)&nmi,
    (uint32_t)&hardfault

 };

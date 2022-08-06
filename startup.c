#include <stdint.h>

int main();

extern uint32_t _data_flash;
extern uint32_t _data_ram;
extern uint32_t _data_size;

extern uint32_t _bss_ram;
extern uint32_t _bss_size;

void init(void)
{
   unsigned char *ram_ptr = (unsigned char *)&_data_ram;
   const unsigned char *flash_ptr = (const unsigned char *)&_data_flash;
   
   for( int i = 0; i < (int)&_data_size; i++)
   {
      *ram_ptr = *flash_ptr;
      ram_ptr++;
      flash_ptr++;
   }

   ram_ptr = (unsigned char *)&_bss_ram;

   for(int i = 0; i < (int)&_bss_size; i++)
   {
      ram_ptr[i] = 0;
   }

}

void reset(void)
{
    init();
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

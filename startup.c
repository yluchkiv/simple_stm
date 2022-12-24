#include <stdint.h>

int main();

extern uint32_t _data_flash;   
extern uint32_t _data_ram;
extern uint32_t _data_size;

extern uint32_t _bss_ram;
extern uint32_t _bss_size;

void init(void)
{
   volatile uint8_t *ram_ptr = (volatile uint8_t *)&_data_ram;
   const uint8_t *flash_ptr = (const uint8_t *)&_data_flash;
   for( int i = 0; i < (int)&_data_size; i++)
   {
      *ram_ptr = *flash_ptr;
      ram_ptr++;
      flash_ptr++;
   }

   ram_ptr = (volatile uint8_t *)&_bss_ram;
   for(int i = 0; i < (int)&_bss_size; i++)
   {
      ram_ptr[i] = 0u;
   }
}

void reset(void)
{
   __asm volatile ("bkpt #0");
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
 
 extern uint32_t _initial_sp;
__attribute__((section(".vector_table"))) const uint32_t vector_table[128] =
{
   (uint32_t)&_initial_sp,
   (uint32_t)&reset,
   (uint32_t)&nmi,
   (uint32_t)&hardfault,
   0u
 };

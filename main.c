
#include "stm32f3xx.h"

int g_var = 10;
int g_ver2;
const int g_var3 = 4;

void myDelay(void);

void pinToggle(void);

int main()
{
    RCC->AHBENR |= RCC_AHBENR_GPIOAEN ; // on 
    __IO uint32_t tmpreg = RCC->AHBENR & (~RCC_AHBENR_GPIOAEN);
    (void)tmpreg;
    GPIOA->MODER |= GPIO_MODER_MODER5_0;  // 0100 0000 0000 we put that value into moder


    
    volatile int a = 0;
    while(1)
    {
        a++;
        GPIOA->ODR ^= GPIO_ODR_5;
        myDelay();

    }
    return 0;
}

void myDelay(void)
{
    for(volatile long i = 0; i < 100000; i++)
    {

    }

}
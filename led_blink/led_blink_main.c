#include <nuttx/config.h>
#include <stdio.h>
#include "../../nuttx/arch/xtensa/src/esp32/esp32_gpio.h"

#define LED_PORT_NUM 32
 
int led_blink_main(int argc, char *argv[])
{
    static int flag;

    esp32_configgpio(LED_PORT_NUM, OUTPUT);

    while (1)
    {
        if( flag )
        {
            esp32_gpiowrite(LED_PORT_NUM, 0);
        }
        else
        {
            esp32_gpiowrite(LED_PORT_NUM, 1);
        }
        flag ^= 1;
        sleep(1);
    }

    return 0;
}

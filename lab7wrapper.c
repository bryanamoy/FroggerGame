#include <stdint.h>

extern int lab7(void);
extern void UART0Handler(void);
extern void Timer0Handler(void);
extern void PortAHandler(void);

int main(void)
{
    lab7();
}

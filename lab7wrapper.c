#include <stdint.h>

extern int frogger(void);
extern void UART0Handler(void);
extern void Timer0Handler(void);
extern void PortAHandler(void);

int main(void)
{
    frogger();
}

#include <pic18f452.inc>

CONFIG  WDT = OFF
CONFIG  OSC = XT

RADIX   DEC

CNT   EQU   0x02  

LFSR    0,0x20
LFSR    1,0x40
LFSR    2,0x60

MOVLW   20
MOVWF   CNT

Loop:
    MOVF   POSTINC0,W
    ADDWF  POSTINC1,W
    MOVWF  POSTINC2

    DECFSZ CNT,F 
    BRA    Loop
hh:
    BRA    hh
END
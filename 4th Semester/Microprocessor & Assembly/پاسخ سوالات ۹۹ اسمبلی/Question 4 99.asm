#include <pic18f452.inc>

CONFIG  WDT = OFF
CONFIG  OSC = XT

RADIX   DEC

CNT   EQU   0x01
CNT_1 EQU   0x02

BCF     TRISC,0

MOVLW   8
MOVWF   CNT

CLRF    CNT_1

Loop:
    BTFSC   0x10,0
    INCF    CNT_1,F
    BCF     STATUS,C
    RRCF    0x10,F
    DECFSZ  CNT,F
    BRA     Loop

BTFSS   CNT_1,0
BSF     PORTC,0
BCF     PORTC,0

END
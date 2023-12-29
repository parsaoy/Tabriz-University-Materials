#include <pic18f452.inc>

CONFIG  WDT = OFF
CONFIG  OSC = XT

RADIX   DEC

CNT EQU 0x01
CNT_A EQU 0x10

ORG 000H
GOTO start

start:

    LFSR    0,0X010
    CLRF    CNT_A

    MOVLW   0xE1    = 224 + 1 = 0xf0 - 0x10 + 1
    MOVWF   CNT 

Loop:
    MOVLW   A'A'
    CPFSEQ  POSTINC0
    BRA     skipIncrement
    INCF    CNT_A,F

skipIncrement:
    DECFSZ  CNT,F
    BRA     Loop      ;GOTO   Loop

END
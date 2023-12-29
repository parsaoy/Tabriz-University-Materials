#include <pic18f452.inc>
CONFIG  WDT = OFF
CONFIG  OSC = XT

RADIX   DEC

ORG     000H
‌BRA    main

ORG     0X08
GOTO    ISR

main:
    SETF    TRISA

    MOVLW   B'00011111'
    ANDWF   TRISB,F

    BCF     RCON,PEIE

    BSF     INTCON,INT0IE
    BSF     INTCON2,INTEDG0

    BSF     INTCON,GIE

StayForever:
    BRA StayForever    


ISR:        ; No BackUp Needed

    BTFSS   INTCON,INT0IF
    RETFIE

    MOVLW   0x1F
    ANDWF   PORTB,F

    MOVLW   60
    CPFSLT  PORTA
    BRA     Middle
    BSF     PORTA,7
    BRA     checkend

Middle:
    MOVLW   80
    CPFSLT  PORTA
    BSF     PORTA,5
    BSF     PORTA,6

checkend:

    BCF     INTCON,INT0IF
    RETFIE

END
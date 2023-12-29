#include <pic18f452.inc>

CONFIG  WDT = OFF
CONFIG  OSC = XT

RADIX   DEC

;####################
MACRO   MOVLF   K,MYREG
        MOVLW   K
        MOVWF   MYREG
ENDM

    SETF    TRISB
    CLRF    TRISC

    MOVLW   0X0F
    ANDWF   PORTB,F

; Case_0:
    MOVLW   0
    CPFSEQ  PORTB
    BRA     Case_2
    MOVLF   B'00000000'
    BRA     ENDCase

Case_1:
    MOVLW   1
    CPFSEQ  PORTB
    BRA     Case_3
    MOVLF   B'00000001'
    BRA     ENDCase

Case_2:
    MOVLW   2
    CPFSEQ  PORTB
    BRA     Case_4
    MOVLF   B'00000011'
    BRA     ENDCase

Case_3:
    MOVLW   3
    CPFSEQ  PORTB
    BRA     Case_5
    MOVLF   B'00000010'
    BRA     ENDCase

Case_4:
    MOVLW   4
    CPFSEQ  PORTB
    BRA     Case_6
    MOVLF   B'00000110'
    BRA     ENDCase

Case_5:
    MOVLW   5
    CPFSEQ  PORTB
    BRA     Case_8
    MOVLF   B'00000111'
    BRA     ENDCase

Case_6:
    MOVLW   6
    CPFSEQ  PORTB
    BRA     Case_7
    MOVLF   B'00000101'
    BRA     ENDCase

Case_7:
.............
.............
.............

DEFAULT:
    MOVLW   15
    CPFSEQ  PORTB
    BRA     ENDCase
    MOVLF   B'00001000'

ENDCase:
    GOTO ENDCase

END
;####################
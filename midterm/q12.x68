    ORG $500

Addr EQU $B000

START:
    ADD.W #41, D4

    LEA Addr, A3            * line 3
    MOVE.L #$7000A0C0, D0   * line 4
    MOVE.W D0, D1           * line 5
    ADDA.W D1, A3           * line 6
    MOVE.L #$BBCC, -(A3)    * line 7
    MOVE.W #$1468, -(A3)    * line 8
    MOVE.L (A3)+, D5        * line 9
    MOVEA.W A3, A6          * line 10
    MOVE.W #7, D7           * line 11
    EOR.L D0, D5            * line 12
    ASR.W D7, D5            * line 13




    END START
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

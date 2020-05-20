    ORG $400

START:
    *MOVE.L #$12, D0
    ADD.W #41, D4
    MOVE.B $FFFF9000, D2
    
    AND.B #$40, D1
    
    * MOVE.L (A1)+, -(A3)
    
    * * Q10
    * ADD.W D2, $B468
    * AND.W A0, $A000
    * ADD.B (A1), D0
    * MOVEA.B D1, A5
    * ADD.B A0, D1
    * MOVE.W $3000, A3
    * ADD.W $1AA7C, D3
    * MOVE.L #$DDDDDDDD, D1
    * MOVE.L #$DDDDDDDD, D0

    * MOVE.W #$FFFF, D1
    * MOVE.W #$5555, D0
    * EOR.W   D1, D0
    * ADD.B   #1, D0

    MOVE.L #$0012B034, D0
    MOVEQ #130, D0



    END START

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

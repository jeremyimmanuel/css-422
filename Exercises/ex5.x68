    ORG $400

START:

    * MOVEA.W #$1234, A1
    * MOVE.W (A1), D0
    * MOVEQ #$82, D0
    * MOVE.W #$2012, $1234
    * MOVE.B $1235, D1

    * MOVEA.W $1235, A1
    * MOVE.W (A1), D0
    * MOVE.W (A2), (A3)
    * MOVEA.L D1, A7
    * MOVE.B (A0), D6
    * ADD.W D7, D4
    * MOVEA.W D1, A4
    * ADD.W D2, (A6)+
    * MOVE.L (A4), D0
    * MOVE.B (A4), D4
    
    * ADD.B D1, (A7)+
    * ADD.B D1, -(A7)
    * ADD.B -(A7),  D1
    * ADD.B D1, (A7)
    
    * ADD.W D1, (A7)
    * ADD.L D1, (A7)
    * ADD.L D1, A7
    * ADD.L (A7), D1

    * MOVE.W $1020, D2    
    * MOVE.B $1020, D2
    * MOVE.L D2, $1020
    * MOVE.W #$1020, D2
    
    * MOVE.W (A2), D7
    * MOVE.W (A2), D5
    * MOVE.W A2, D5
    * MOVE.W D5, (A2)
    
    * MOVEA.L D1, A7
    * ADD.L #24, D7
    
    * MOVE.B (A2), D2
    
    * MOVE.B (A0), D6
    
    * MOVEA.W -(A4), A0

    * MOVEA.L -(A0), A4
    * MOVEA.W (A0)+, A4
    * MOVEA.W -(A0), A4

    * ADD.W (A1), D0
    * ADD.L A1, D0
    * ADD.L (A1), D0
    * ADD.L D0, (A1)

    * MOVE.B (A2)+, D5
    * MOVE.B (A2), D5
    * MOVE.B D5, (A2)
    * MOVE.B A2, D5

    * ADD.W D7, (A6)

    * MOVE.L #$2346, D0
    * MOVE.L $2346, D0
    * MOVE.W $2346, D0
    * MOVE.L D0, $2346

    * ADD.W D7, #$A000
    * ADD.W $A000, D7
    * ADD.W D7, $A000
    * ADD.W #$A000, D7

    * MOVE.W (A3), D4
    * MOVE.L (A4), D0
    * MOVE.B $2346, D3

    * MOVE.B (A2), D2
    * ADD.B (A0), D6

    *MOVE.L $1200D7, D3
    *MOVEA.L D6, D8
    *MOVE.W $1000, A3
    *ORI.W #$55AA007C, D4
    *ADD.B D0, #$A369


    *MOVEA.W A1, $1234
    *MOVE.W #$220033, D5
    *MOVEA.W A1, $1234
    
*    MOVE.B $A000, D0
*    MOVE.B $FFFF4000, D0
*    MOVEA.W #$8000, A0

*    MOVEA.W $00004000, A0
*    LEA $FFFF4000, A0
    
*    MOVEA.W #8000, A0
*   MOVEA.L $8000, A0
*    MOVEA.W $8000, A0

    LEA $FFFF8000, A0
    
    MOVE.B $A000, D0
    
    MOVE.B $00004000, D0
    
    MOVEA.W #$8000, A0
    
    MOVEA.W #$1200, A4
    MOVE.W (A3), D4
    MOVE.B (A2), D2
    MOVE.B (A4), D4
    
    * Question 7
    MOVE.B (A2)+, D5
    MOVE.B (A2), D5
    MOVE.B A2, D5
    MOVE.B D5, (A2)
    
    * Question 8
    MOVE.B A4, D2
    MOVE.B -(A4), D2
    MOVE.B D2, (A4)
    MOVE.B (A4), D2
    
    * Question 9
    ADD.L D1, (A7)
    ADD.W D1, (A7)
    ADD.L D1, A7
    ADD.L (A7), D1
    
    * Question 10
    MOVEA.W A1, A5
    MOVEA.W (A1), (A5)
    MOVEA.W (A5), A1
    MOVEA.W (A1), A5
    
    * Question 11
    ADD.B D1, -(A7)
    ADD.B -(A7), D1
    ADD.B D1, (A7)
    ADD.B D1, (A7)+
    
    * Question 1
    MOVEA.W D1, A4
    
    * Question 2
    MOVE.B (A0), D6
    
    * Q1
    ADD.W D7, D3
    
    
    
    
    END START


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

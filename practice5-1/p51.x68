    ORG $400

START:

    * MOVEA.L #8000, A0

    * Question 2
    * MOVEA.W #$1236, A1
    * MOVE.B -(A1), D0

    * Question 3
*    MOVEA.W #$8000, A0

*   Question 4
*    MOVEQ #$70, D0
    
    *MOVE.W #$1ABC, $1234
    *MOVE.B $1235, D0
    
    
    * DIVU.W #$80, D0
    
    *EXT.L D0
    
    *ADDA.W D0, A0
    
    
    *NOT.L D0
    
*    ORI.B #%01111101, D0
    
*    OR.B D1, D0
    
    BCHG #3, D0
    
    
    END START
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

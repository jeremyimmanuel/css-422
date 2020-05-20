    ORG $1000

Addr EQU $A000

START:
    * LEA Addr, A3
    * MOVE.W #$BCDF, -(A3)
    * MOVE.L #$9856, -(A3)
    * MOVEA.W A3, A6
    * MOVEA.W #$5C7A, A5
    * MOVE.W A5, D5
    * MOVE.W #$11, D7
    * ROL.L  D7, D5
    * MOVE.W (A3)+, D1
    * MOVE.L (A3)+, D7
    * EOR.W D7, D5
    * MOVE.W D5, -(A3)
    * MOVE.W (A3)+, D0

    * MOVE.B $A000, D4

    * ADD.B (A0), D6
    * MOVE.B (A0), D6

    * QUESTION 11
    * LEA     $4000, A0
    * MOVE.L  #$AAAAFFFF, D7
    * MOVE.L  #$55550000, D6
    * MOVE.W  D7, D0
    * SWAP    D6
    * SWAP    D0
    * MOVE.W  D6, D0
    * MOVE.L  D0, (A0)


    * QUESTION 12
    LEA     Addr, A3
    MOVE.W  #$BCDF, -(A3)
    MOVE.L  #$9856, -(A3)
    MOVEA.W A3, A6
    MOVEA.W #$5C7A, A5
    MOVE.W  A5, D5
    MOVE.W  #$11, D7
    ROL.L   D7, D5
    MOVE.W  (A3)+, D1
    MOVE.L  (A3)+, D7
    EOR.W   D7, D5
    MOVE.W  D5, -(A3)
    MOVE.W  (A3)+, D0


    END START
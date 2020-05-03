    ORG $1000

STARTADDR   EQU     $4000
ENDADDR     EQU     $6000
DATA        EQU     $AA
TARGET      EQU     $B000
ANS         EQU     $4051

Addr1       DS.L    1
Addsum      DS.W    1
CarryBit    DS.B    1

ADDR1STRING     DC.B 'Addr1 : ', 0
ADDSUMSTRING    DC.B 'Addsum : ', 0
CARRYBITSTRING  DC.B 'CarryBit : ', 0



CR          EQU     $0D
LF          EQU     $0A
NEWLINE     DC.B    CR,LF,0



START:
* TEST 
TEST    MOVEA.L #STARTADDR, A6 
        
        MOVE.B #DATA, TARGET    * set value to target
        MOVE.B (TARGET), D0     * move value to D0
        
        MOVE.B #DATA, ANS      * set value to answer addr1
        

        BRA FIND_LOOP


FIND_LOOP   CMPA.L #ENDADDR, A6 * check if in range between $4000 and $6000
            BGE OUT             * if greater than ending address, stop

            CMP.B (A6)+, D0 * check value at curr address
            BEQ EQUAL       * if equal branch to EQUAL
            BRA FIND_LOOP   * LOOP AGAIN

OUT         MOVEA.L #STARTADDR, A1  * set STARTADDR to A1
            MOVE.L A1, Addr1        * set A1 to Addr1
            BRA SUM256SETUP              * Move on to sum loop

EQUAL       SUBA.L #1, A6       * decrement address by 1 because of post incrementation in prev instructions
            MOVE.L A6, Addr1    * Put address in Addr1 var
            BRA SUM256SETUP          * 

SUM256SETUP * Setup start and end address
            MOVEA.L Addr1, A7   * we want to store the loop ending address at A7 
            ADDA.L #258, A7     * Add 256 bytes because of the instructions

            * Setup inital values
            MOVE.W #0, Addsum   * initialize Addsum as 0
            MOVE.B #0, CarryBit * initialize CarryBit as 0

            CLR D1              * Setup D1

SUM256      * Check if iteration < 256
            CMPA.L A7, A6       * Compare address at A7 and A6
            BGT DISPLAY         * BGE or BGT?

            * Add value to Addsum
            MOVE.B (A6)+, D1    * move value in A6 to D1 and increment A6
            ADD.W D1, Addsum    * add value to Addsum
            BCS GOTCARRY
            BRA SUM256            


GOTCARRY    MOVE.B #1, CarryBit
            BRA SUM256

PRINTLN     LEA NEWLINE, A1
            MOVE.B #14, D0
            TRAP #15

            BRA DISPLAY


DISPLAY     * Print Addr1 : [Addr1] in decimal value
            LEA ADDR1STRING, A1
            MOVE.B #14, D0
            TRAP #15

            MOVE.L Addr1, D1    * Prints
            MOVE.B #3, D0       * res
            TRAP #15

            LEA NEWLINE, A1
            MOVE.B #14, D0
            TRAP #15

            LEA ADDSUMSTRING, A1
            MOVE.B #14, D0
            TRAP #15

            CLR.L D1
            MOVE.W Addsum, D1
            MOVE.B #3, D0
            TRAP #15

            LEA NEWLINE, A1
            MOVE.B #14, D0
            TRAP #15



            LEA CARRYBITSTRING, A1
            MOVE.B #14, D0
            TRAP #15

            CLR.L D1
            MOVE.B CarryBit, D1
            MOVE.B #3, D0
            TRAP #15



    END START

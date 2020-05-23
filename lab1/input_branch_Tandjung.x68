*-----------------------------------------------------------
* Title      : Input Branch
* Written by : Jeremy Tandjung
* Date       : 04/09/2020
* Description:
*-----------------------------------------------------------

CR EQU $0D
LF EQU $0A

START ORG $1000

* Code for output
LOOP    LEA     instructions, A1
        MOVE.B  #14, D0
        TRAP    #15

* Code for input
* Only 20 - 25
        MOVE.B  #4, D0
        TRAP    #15
        CMP.L   #1711168, D1
        BEQ     DONE

        CMP.B   #20, D1
        BLT     WARNING
        BEQ     ANS_20

        CMP.B   #21, D1
        BEQ     ANS_21
        
        CMP.B   #22, D1
        BEQ     ANS_22
        
        CMP.B   #23, D1
        BEQ     ANS_23

        CMP.B   #24, D1
        BEQ     ANS_24

        CMP.B   #25, D1
        BGT     WARNING
        BEQ     ANS_25

        BRA     LOOP

        
ANS_20  LEA     text_20, A1
        MOVE.B  #14, D0
        TRAP    #15 
        BRA     LOOP

ANS_21  LEA     text_21, A1
        MOVE.B  #14, D0
        TRAP    #15 
        BRA     LOOP

ANS_22  LEA     text_22, A1
        MOVE.B  #14, D0
        TRAP    #15 
        BRA     LOOP

ANS_23  LEA     text_23, A1
        MOVE.B  #14, D0
        TRAP    #15 
        BRA     LOOP

ANS_24  LEA     text_24, A1
        MOVE.B  #14, D0
        TRAP    #15 
        BRA     LOOP

ANS_25  LEA     text_25, A1
        MOVE.B  #14, D0
        TRAP    #15 
        BRA     LOOP


WARNING LEA     warning_msg, A1
        MOVE.B  #14, D0
        TRAP    #15
        BRA     LOOP

DONE    MOVE.B  #9, D0
        TRAP    #15


text_20     DC.B 'This year is 2020', CR, LF
            DC.B CR, LF, 0
text_21     DC.B '21 years old is the legal drinking age in the US', CR, LF
            DC.B CR, LF, 0
text_22     DC.B '22 is a song by Taylor Swift on her fourth album, Red', CR, LF
            DC.B CR, LF, 0
text_23     DC.B 'Michael Jordan wore number 23 for the Chicago Bulls', CR, LF
            DC.B CR, LF, 0
text_24     DC.B 'Pure gold is 24 carats', CR, LF
            DC.B CR, LF, 0
text_25     DC.B '25 is a square number, being 5^2 = 5 x 5 = 25', CR, LF
            DC.B CR, LF, 0

instructions    DC.B 'Enter a number from 20 - 25', CR, LF
                DC.B 'Enter 1711168 to exit', CR, LF, 0

warning_msg     DC.B 'Out of bounds!', CR, LF
                DC.B CR, LF, 0


    END START
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

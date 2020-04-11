*-----------------------------------------------------------
* Title      : Easy68k Lab
* Written by : Jeremy Tandjung
* Date       :
* Description:
*-----------------------------------------------------------
 
START ORG $1000



        LEA     MESSAGE,A1
        MOVE.B  #14,D0
        TRAP    #15
        
        MOVE.B  #9, D0
        TRAP    #15

CR EQU $0D
LF EQU $0A        

MESSAGE         DC.B 'Hello, my name is Jeremy.', CR, LF
                DC.B 'I am a senior at UW Bothell majoring in CSSE.', CR, LF
                DC.B CR, LF
                DC.B 'I am using wine on my ubuntu machine and it has a weird bug, like', CR, LF
                DC.B '    When I click ctrl + z, it erases everything before the cursor and not undo.', CR, LF
                DC.B '    Luckily, I can still undo from the menu', CR, LF
                DC.B 'I am considering using my windows machine but I really like using ubuntu.', CR, LF
                DC.B 'So we will see.', CR, LF
                DC.B CR, LF
                DC.B 'Thank you for listening', 0




        END START
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

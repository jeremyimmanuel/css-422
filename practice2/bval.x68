* Jeremy Tandjung

foo     EQU     $AAAA
bar     EQU     $5555
mask    EQU     $FFFF
start   EQU     $400
memory  EQU     $0000A000
plus    EQU     $00000001
magic   EQU     $2700

 

 
    ORG start
        MOVE.W  #foo, D0           * Load foo to D0
        MOVE.W  #bar, D7           * Load bar to D7
        MOVEA.L #memory, A0        * 
        MOVEA.L A0, A1
        MOVE.B  D0, (A0)
        ADDA.L  #plus,A0
        MOVE.B  D7, (A0)
        ADDA.L  #plus,A0
        MOVE.W  #mask,D3
        MOVE.W  D3, (A0)
        MOVE.L  (A1), D4
        SWAP    D4
        MOVE.L  D4, D6
        MOVE.L  D6, (A1)
        STOP    #magic
    END start


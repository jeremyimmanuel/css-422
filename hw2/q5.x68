    ORG $1000




EQUAL:

    

NOTEQUAL:


OUT:

COMPARE:
    * check if in range between $4000 and $6000
    CMPA.W $6000, A6
    BGE OUT


    
    CMP.B (A6)+, (A0)   * check value at curr address
    BEQ EQUAL           * if equal branch to EQUAL
    BNE NOTEQUAL        * else; branch to NOTEQUAL


START:

    MOVEA $4000, A6


    MOVE.B #$12, $B000

    MOVEA.W $B000, A0




    

    END START

    ORG $400

START:

    * ROL.W #3, D0

    * MOVEM.W A0-A2/D7/D5, -(A7)


    *  A0 AB123456, 11111
    LEA 8000, A0


    END START
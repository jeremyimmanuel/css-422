*-----------------------------------------------------------
* Title      : HW1_Q4
* Written by : Jeremy Tandjung
* Date       : 04/11/2020
* Description:
*-----------------------------------------------------------

addr1     EQU     $4000        

addr2     EQU     $4001 

data2     EQU     $A7FF 

data3     EQU     $5555 

data4     EQU     $0000 

data5     EQU     4678 

data6     EQU     %01001111 

data7     EQU     %00010111 

******************************************************************************
*
* Beginning of code segment. This is the actual assembly language instructions.
*
******************************************************************************

 ORG $400

start   MOVE.W #data2, D0       * Load D0
        MOVE.B #data6, D1       * Load D1
        MOVE.B #data7, D2       * Load D2
        MOVE.W #data3, D3       * Load D3
        MOVEA.W #addr1, A0      * Load address register
        MOVE.B D1, (A0)+        * transfer byte to memory
        MOVE.B    D2,(A0)+      * transfer second byte
        MOVEA.W   #addr1,A1     * load address 
        AND.W     D3,(A1)       * Logical AND

*Stop here. The next instruction shows how a label is used

JMP start

END $400
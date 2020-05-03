*-----------------------------------------------------------
* Title      : Pattern Finding and Cumulative Program
* Written by : Nathan Phan
* Date       : 4/28/2019
* Description: This program searches through the start and
*              and end addresses for a byte data pattern
*              and stores the address in memory. From this 
*              address, cumulatively adds the next 512 bytes
*              and stores the total sum as a word and displays
*              if there is a carry bit.
*-----------------------------------------------------------

    ORG    $1000
START:                          * Label for the first instruction of program

            LEA PROMPTALERT, A1	* This will prompt the user to put in a byte sized HEX thing
            MOVE.B #14,D0
            TRAP #15            * This will display the prompt
            
            MOVE.B #2,D0        * This will allow input / output operations
            TRAP #15            * This will read in a string from user to be stored in A1
            CLR D0              * This will make sure D0 is clear conversion subroutine begins
            JSR CONVERTFROMASCII	* This will jump to a subroutine for 
									* converting the inputted string from ascii to a usable value 
									* and eventually saving to $A000
									
            MOVEA.L #$6000, A2   	* Put address $6000 into A1, it is the starting address
            MOVE.B ($A000),D1    	* Store the contents of A1 into D1
READLOOP    CMPA.L #$8000, A2    	* do a comparison with out current position and $8000 (the ending address)
            BGT VALUENOTFOUNDCASE	* If it goes past $8000 and no match, go to the VALUENOTFOUNDCASE label
            CMP.B (A2)+,D1       	* Compare the contents at address locations A2 with D1
            BEQ FOUND            	* If it found a match, go to the FOUND label
            BRA READLOOP         	* If no match was found go to the start of the loop
                       
VALUENOTFOUNDCASE    MOVEA.L #$6000, A2  * This will make the address $6000 as a default if never found
					 MOVE.L A2, Addr1    * This will move the address from A2 to the Addr1 variable
					 BRA ADDLOOPSTRT     * Branch to the addition loop

FOUND       ADDA.L #-1,A2       * set back one place to get the address of the actual match
            MOVE.L A2, Addr1    * store the address in the Addr1 variable
            BRA ADDLOOPSTRT     * go to the start of the add loop

ADDLOOPSTRT MOVEA.L A2,A3       * Move the starting address into the ending address
            ADDA.L #512,A3      * add 512 to it to make it the actual ending address
            MOVE.W #0,Addsum    * set our addition to 0
            MOVE.B #0,CarryBit
            CLR D2              * clear D2 just in case
            
ADDLOOP     CMPA.L A3,A2        * compare our current address with the ending address
            BGE PRINT           * if the current address is greater than or equal to our ending address
                                * go to the print label
            MOVE.B (A2)+, D2    * move the contents of A2 into D2
            ADD.W  D2, Addsum   * add the current sum with D2
            BCS SETCARRY        * if the carry was set, goto the SETCARRY label
            BRA ADDLOOP         * otherwise go to the start of the loop
            
SETCARRY    MOVE.B #1, CarryBit * Sets 1 as value for CarryBit variable 
            BRA ADDLOOP         * This was done to provide evidence that the print out was made
                 
PRINT       LEA NEWLINE, A1     * Formatting changes for A1 
            MOVE.B #14,D0
            TRAP #15            * Show the print out
            
            LEA ADDRONE, A1     * Place the ADDRONE into A1
            MOVE.B #14,D0
            TRAP #15            * Show the print out
            
            LEA Addr1, A1       * Place Addr1 into A1
            MOVE.B #4, D5       * copy 4 into D5 (number of bytes to print)
            JSR PRINTHEX        * print the number at A1 in hex
            
            LEA NEWLINE, A1     * Place a blank newline into A1
            MOVE.B #14,D0
            TRAP #15            * Show the print out
            
            LEA ADDSUMSTR, A1   * Place the ADDSUMSTR into A1
            MOVE.B #14,D0
            TRAP #15            * Show the print out
            
            LEA Addsum, A1      * Place Addsum into A1
            MOVE.B #2, D5       * Stores immediate 2 into D5 to represent the number of bytes for display
            JSR PRINTHEX        * print the number at A1 in hex
            
            LEA NEWLINE, A1     * Place a blank newline into A1
            MOVE.B #14,D0
            TRAP #15            * Show the print out
            
            
            LEA THECARRYBIT, A1     * Place the ADDRONE into A1
            MOVE.B #14,D0
            TRAP #15            * Show the print out
            
            
            MOVE.B CarryBit, D1
            LEA PROMPTALERT, A1        * Place the first message into A1
            MOVE.B #3,D0
            TRAP #15            * Show the print out
            
CONVERTFROMASCII 	MOVEA.L #$A000, A3
					MOVE.B (A1),D3      	* Stores the first hex character to D3
					CMP.B #0, D3        	* check if we found the null terminator
					BEQ ESCAPEFROMTHEBRANCH	* If we do, return from subroutine
					MOVE.B (A1)+,D4     	* Stores the first hex character to D4
					LSR.B #4, D3        	* Logical shift right of D3 to just get the top 4 bits
					LSL.B #4, D4        	* Logical shift left of D4 two times for bottom 4 bits
					LSR.B #4, D4
					CMP.B #3,D3         	* If D3 is equal to 3, this hex value is a number
					BEQ CONVERTNUMBER   	* Goes to subroutine for converting value to a number
					BRA CONVERTLETTER
            
ESCAPEFROMTHEBRANCH     RTS                 * Control flow away from CONVERT subroutines.            
            
CONVERTNUMBER	CMP.B #0, D0
				BEQ SHIFT
				CLR D0
				ADD.B D4, (A3)+    * move the number value into
				BRA CONVERTFROMASCII

CONVERTLETTER	ADD.B #9, D4
				CMP.B #0, D0
				BEQ SHIFT
				CLR D0
				ADD.B D4, (A3)+
				BRA CONVERTFROMASCII
            
SHIFT       LSL.B #4, D4
            MOVE.B D4, (A3)
            MOVE.B #1, D0
            BRA CONVERTFROMASCII
                        
PRINTHEX    CMP.B #0, D5
            BEQ ESCAPEFROMPRINTHEX
            MOVE.B (A1),D3
            MOVE.B (A1)+,D4
            
            LSR.B #4, D3
            LSL.B #4, D4
            LSR.B #4, D4
            
            CLR D6
            MOVE.B D3,D1
            CMP.B #10,D3
            BLT PRINTNUM
            BRA PRINTLET

PRINTSEC    MOVE.B D4,D1
            CMP.B #10,D4
            BLT PRINTNUM
            BRA PRINTLET
                        
ESCAPEFROMPRINTHEX	RTS           
            
            
PRINTNUM    ADD.B #$30, D1
            MOVE.B #6, D0
            TRAP #15
            
            CMP.B #0, D6
            BEQ SWAP
            
            SUB.B #1, D5
            BRA PRINTHEX

* This subroutine allows the printing of letters
* Notice that it adds HEX value '40' to the 
* Data Register #1 this is necessary for 
* proper display. 
PRINTLET    SUB.B #9, D1
            ADD.B #$40, D1
            MOVE.B #6, D0
            TRAP #15
            
            CMP.B #0, D6
            BEQ SWAP
            
            SUB.B #1, D5
            BRA PRINTHEX

SWAP        MOVE.B #1, D6
            BRA PRINTSEC

* Put program code here

            SIMHALT             * halt simulator

* Put variables and constants here

CR          EQU     $0D
LF          EQU     $0A
NEWLINE     DC.B    CR,LF,0

PROMPTALERT DC.B    'Please enter a byte sized hex number. Please only represent letters in capital letters:',CR,LF,0
ADDRONE     DC.B    'Addr1: ',0
ADDSUMSTR   DC.B    'Addsum: ',0
THECARRYBIT DC.B    'CarryBit: ',0

Addr1       DS.L    1   * Declaring value for Addr1
Addsum      DS.W    1   * Declaring value for Addsum
CarryBit    DS.B    1	* Declaring value for CarryBit


    END    START        * Last line of source code.
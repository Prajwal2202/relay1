
		org 00h
		sjmp main

		ORG		03H
		ACALL	INT0_ISR
		RETI

INT0_ISR:
		ACALL	DELAY1
Wait:
		ACALL	DELAY1
		MOV		A, P3
		ANL		A, #4
		JZ		Wait
		MOV		A, P3
		ANL		A, #4
		JZ		Wait

		MOV		A, P0
		CPL		A
		MOV		P0, A
		
		RET
	

main:	MOV		P0, #0xFF
	   	
		SETB	EA
		SETB	EX0
		CLR		IT0	

BACK:
		SJMP	BACK

DELAY1:
		DJNZ	R0, DELAY1
		DJNZ	R1, DELAY1
		RET

		
		END

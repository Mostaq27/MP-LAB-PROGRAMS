.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC

MOV DL,'?'
MOV AH,2
INT 21H
MOV AH,1
INT 21H
MOV BL,AL
INT 21H
MOV BH,AL

CMP BL,BH
JG SWITCH
JMP DISPLAY

SWITCH: XCHG BL,BH

DISPLAY:
MOV AH,2
MOV DL,0AH
INT 21H
MOV DL,BL
INT 21H
MOV DL,BH
INT 21H

OUT:
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN
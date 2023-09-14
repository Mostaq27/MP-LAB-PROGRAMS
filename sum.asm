 

.MODEL SMALL

.DATA
    MSG DB 0AH, 0DH, 'Enter the first number: $'
    NUM1 DB ?
    MSG2 DB 0AH, 0DH, 'Enter the second number: $'
    NUM2 DB ?
    RESULT_MSG DB 0AH, 0DH, 'The result is: $'
    RESULT DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display message to enter the first number
    LEA DX, MSG
    MOV AH, 09h
    INT 21h

    ; Read the first number from the user
    MOV AH, 01h
    INT 21h
    SUB AL, '0'   ; Convert ASCII digit to numeric
    MOV NUM1, AL

    ; Display message to enter the second number
    LEA DX, MSG2
    MOV AH, 09h
    INT 21h

    ; Read the second number from the user
    MOV AH, 01h
    INT 21h
    SUB AL, '0'   ; Convert ASCII digit to numeric
    MOV NUM2, AL

    ; Perform addition
    MOV AL, NUM1
    ADD AL, NUM2
    MOV RESULT, AL

    ; Display the result
    LEA DX, RESULT_MSG
    MOV AH, 09h
    INT 21h

    ; Display the result value
    MOV DL, RESULT
    ADD DL, '0'    ; Convert numeric result to ASCII
    MOV AH, 02h
    INT 21h

    ; Exit program
    MOV AH, 4Ch
    INT 21h
MAIN ENDP

END MAIN

; 1. Decimal-> Binary, Binary->Decimal, Hexa-> Decimal, Decimal-> Hexa, Binary->Octal, Octal->Binary. 2. Work with 8 bit binary, 3 digits hex and 3 digit octal numbers
; 2. Can you do any base to any base conversion? User will provide the base of the input number and the base of the output number.
.MODEL SMALL
.STACK 100H
.DATA
    PROMPT DB "Select type of conversion or type q to quite: $"
    DEC2BIN DB "1. Decimal to Binary$"
    BIN2DEC DB "2. Binary to Decimal$"
    HEX2DEC DB "3. Hexadecimal to Decimal$"
    DEC2HEX DB "4. Decimal to Hexadecimal$"
    BIN2OCT DB "5. Binary to Octal$"
    OCT2BIN DB "6. Octal to Binary$"
    ANY DB "7. Any base to Any base$"
    INBASE DB "Enter Base of Input Number: $"
    INP DB "Enter The Number: $"
    OUTBASE DB "Enter Base of Output Number: $"
    DE DB "Enter Decimal Number (4 digits): $"
    BIN DB "Enter Binary Number (8 digits): $"
    HEX DB "Enter Hexadecimal Number (3 digits): $"
    OCT DB "Enter Octal Number (3 digits): $"
    RESULT DB "Result: $"
    INVALID_MSG DB "Invalid input!$"
    GOODBYE DB "Goodbye!$"
    
.CODE  
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
       
        LEA DX, DEC2BIN
        MOV AH, 9
        INT 21H

        CALL CRLF

        LEA DX, BIN2DEC
        INT 21H

        CALL CRLF

        LEA DX, HEX2DEC
        INT 21H

        CALL CRLF

        LEA DX, DEC2HEX
        INT 21H

        CALL CRLF

        LEA DX, BIN2OCT
        INT 21H

        CALL CRLF

        LEA DX, OCT2BIN
        INT 21H

        CALL CRLF

        LEA DX, ANY
        INT 21H

        MAIN_LOOP:

        CALL CRLF

        MOV AH, 9
        LEA DX, PROMPT
        INT 21H

        MOV AH, 1
        INT 21H

        CALL CRLF

        CMP AL, '1'
        JE D2BCONV

        CMP AL, '2'
        JE B2DCONV

        CMP AL, '3'
        JE H2DCONV

        CMP AL, '4'
        JE D2HCONV

        CMP AL, '5'
        JE B2OCONV

        CMP AL, '6'
        JE O2BCONV

        CMP AL, '7'
        JE ANYCONV
        
        CMP AL, 'Q'
        JE EXIT

        CMP AL, 'q'
        JE EXIT

        CALL PRNT_INVALID
        JMP MAIN_LOOP

        D2BCONV:
        MOV AH, 9
        LEA DX, DE
        INT 21H
        MOV DI, 4             ; DIGITS
        MOV SI, 10            ; BASE
        CALL INPUT            ; INPUT(DI, SI)
        CMP AX, -1
        JNE C1
        CALL CRLF
        CALL PRNT_INVALID
        JMP MAIN_LOOP
        C1: 
        CALL CRLF
        MOV CX, 2
        CALL SHOWCONVERTED    ; SHOWCONVERTED(CX, AX)

        JMP MAIN_LOOP
        B2DCONV:
        MOV AH, 9
        LEA DX, BIN
        INT 21H
        MOV DI, 8             ; DIGITS
        MOV SI, 2             ; BASE
        CALL INPUT            ; INPUT(DI, SI)
        CMP AX, -1
        JNE C2
        CALL CRLF
        CALL PRNT_INVALID
        JMP MAIN_LOOP
        C2:
        CALL CRLF
        MOV CX, 10
        CALL SHOWCONVERTED    ; SHOWCONVERTED(CX, AX)
        JMP MAIN_LOOP
        H2DCONV:
        MOV AH, 9
        LEA DX, HEX
        INT 21H
        MOV DI, 3             ; DIGITS
        MOV SI, 16             ; BASE
        CALL INPUT            ; INPUT(DI, SI)
        CMP AX, -1
        JNE C3
        CALL CRLF
        CALL PRNT_INVALID
        JMP MAIN_LOOP
        C3:
        CALL CRLF
        MOV CX, 10
        CALL SHOWCONVERTED    ; SHOWCONVERTED(CX, AX)
            
        JMP MAIN_LOOP
        D2HCONV:
        MOV AH, 9
        LEA DX, DE
        INT 21H
        MOV DI, 4             ; DIGITS
        MOV SI, 10             ; BASE
        CALL INPUT            ; INPUT(DI, SI)
        CMP AX, -1
        JNE C4
        CALL CRLF
        CALL PRNT_INVALID
        JMP MAIN_LOOP
        C4:
        CALL CRLF
        MOV CX, 16
        CALL SHOWCONVERTED    ; SHOWCONVERTED(CX, AX)

        JMP MAIN_LOOP
        B2OCONV:
        MOV AH, 9
        LEA DX, BIN
        INT 21H
        MOV DI, 8             ; DIGITS
        MOV SI, 2             ; BASE
        CALL INPUT            ; INPUT(DI, SI)
        CMP AX, -1
        JNE C5
        CALL CRLF
        CALL PRNT_INVALID
        JMP MAIN_LOOP
        C5:
        CALL CRLF
        MOV CX, 8
        CALL SHOWCONVERTED    ; SHOWCONVERTED(CX, AX)

        JMP MAIN_LOOP
        O2BCONV:
        MOV AH, 9
        LEA DX, OCT
        INT 21H
        MOV DI, 3             ; DIGITS
        MOV SI, 8             ; BASE
        CALL INPUT            ; INPUT(DI, SI)
        CMP AX, -1
        JNE C6
        CALL CRLF
        CALL PRNT_INVALID
        JMP MAIN_LOOP
        C6:
        CALL CRLF
        MOV CX, 2
        CALL SHOWCONVERTED    ; SHOWCONVERTED(CX, AX)

        JMP MAIN_LOOP
        ANYCONV:
        MOV AH, 9
        LEA DX, INBASE
        INT 21H
        MOV DI, 2
        MOV SI, 10
        CALL INPUT          ; INPUT(DI, SI)
        CMP AX, -1
        JNE C7
        CALL CRLF
        CALL PRNT_INVALID
        CALL CRLF
        JMP ANYCONV
        C7:
        MOV BX, AX          ; BX = BASE OF INPUT NUMBER
        OUTBA:
        CALL CRLF
        MOV AH, 9
        LEA DX, OUTBASE
        INT 21H
        MOV DI, 2
        MOV SI, 10
        CALL INPUT          ; INPUT(DI, SI)
        CMP AX, -1
        JNE C8
        CALL CRLF
        CALL PRNT_INVALID
        JMP OUTBA
        C8:
        MOV CX, AX          ; CX = BASE OF OUTPUT NUMBER
        INPNUM:
        CALL CRLF
        MOV AH, 9
        LEA DX, INP
        INT 21H
        MOV DI, 3
        MOV SI, BX
        CALL INPUT          ; INPUT(DI, SI)
        CMP AX, -1
        JNE C9
        CALL CRLF
        CALL PRNT_INVALID
        JMP INPNUM
        C9:
        CALL CRLF
        CALL SHOWCONVERTED  ; SHOWCONVERTED(CX, AX)

        JMP MAIN_LOOP

        END_MAIN_LOOP:

        EXIT:
        MOV AH, 9
        LEA DX, GOODBYE
        INT 21H        
        MOV AX, 4C00H
        INT 21H 
        
    MAIN ENDP
    
    PRNT_INVALID:
    LEA DX, INVALID_MSG
    MOV AH, 9
    INT 21H
    RET

    CRLF:
    PUSH AX
    PUSH DX
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    POP DX
    POP AX
    RET

    INPUT:
    PUSH BX
    PUSH DX
    PUSH DI
    PUSH CX
    MOV CX, DI
    INPUT_LOOP:
    MOV AH, 1
    INT 21H
    CMP AL, "0"
    JL INPUT_ERR
    CMP AL, "9"
    JG L1
    SUB AL, "0"
    JMP END_IF
    L1:
    CMP AL, "A"
    JL INPUT_ERR
    CMP AL, "F"
    JG INPUT_ERR
    SUB AL, "A"
    ADD AL, 10
    END_IF:
    MOV AH, 0
    CMP AX, SI
    JGE INPUT_ERR
    PUSH AX
    LOOP INPUT_LOOP
    MOV BX, 0
    MOV CX, 1 ; MULTIPLIER
    RESULT_LOOP:
    CMP DI, 0
    JLE END_RESULT_LOOP
    POP AX
    MUL CX
    ADD BX, AX
    MOV AX, SI
    MUL CX
    MOV CX, AX
    DEC DI
    JMP RESULT_LOOP
    INPUT_ERR:
    SUB DI, CX
    MOV CX, DI
    CLEAR_STACK:
    CMP CX, 0
    JLE END_CLEAR_STACK
    POP AX
    DEC CX
    JMP CLEAR_STACK
    END_CLEAR_STACK:
    MOV AX, -1
    POP CX
    POP DI
    POP DX
    POP BX
    RET
    END_RESULT_LOOP:
    MOV AX, BX      ; AX = RESULT (return value)
    POP CX
    POP DI
    POP DX
    POP BX
    RET

    SHOWCONVERTED:
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    MOV BX, 0
    CMP AX, 0
    JNE NON_ZERO
    MOV DL, "0"
    MOV AH, 2
    NON_ZERO:
    DIV_LOOP:
    CMP AX, 0
    JLE DIV_END
    MOV DX, 0
    DIV CX
    CMP DX, 10
    JL SAVE_NUM
    SUB DX, 10
    ADD DX, "A"
    PUSH DX
    INC BX
    JMP DIV_LOOP
    SAVE_NUM:
    ADD DX, "0"
    PUSH DX
    INC BX
    JMP DIV_LOOP
    DIV_END:
    MOV AH, 9
    LEA DX, RESULT
    INT 21H
    MOV CX, BX
    PRNT_LOOP:
    CMP CX, 0
    JLE PRNT_LOOP_EXIT
    POP BX
    MOV AH, 2
    MOV DL, BL
    INT 21H
    DEC CX
    JMP PRNT_LOOP
    PRNT_LOOP_EXIT:
    POP DX
    POP CX
    POP BX
    POP AX
    RET

    END MAIN

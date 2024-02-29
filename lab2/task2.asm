data segment
    m1 db "Enter operand 1: $"
    m2 db "Enter operand 2: $"
    type db "Enter type of operation (/, *, +, -): $"
    res db "Result of the operation is: $"
    invalid db "Invalid type given$"
    answer db ?
ends

code segment
    start:
    
    mov ax, data
    mov ds, ax
    
    lea dx, m1
    mov ah, 9
    int 21h ; Prompting for taking first operand
    
    mov ah, 1
    int 21h ; Taking the operand
    
    mov cl, al ; Saving the operand
    sub cl, "0"
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h ; CRLF
    
    lea dx, m2
    mov ah, 9
    int 21h ; Prompting for taking second operand
    
    mov ah, 1
    int 21h ; Taking the operand
    
    mov ch, al ; Saving the operand
    sub ch, "0"
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h ; CRLF
    
    lea dx, type
    mov ah, 9
    int 21h ; Prompting for taking type of operation
    
    mov ah, 1
    int 21h ; Taking the type input
    
    mov bl, al ; Saving the type
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h ; CRLF
    
    lea dx, res
    mov ah, 9
    int 21h ; Showing message for result
    
    cmp bl, "/"
    je division
    cmp bl, "*"
    je multiplication
    cmp bl, "+"
    je addition
    cmp bl, "-"
    je subtraction
    
    lea dx, invalid
    mov ah, 9
    int 21h ; Showing invalid message
    jmp exit
    
    division:
 
    mov al, cl
    mov ah, 0
    div ch
    mov cl, al ; Saving the quotient
    
    mov ah, 2
    mov dl, cl
    add dl, "0"
    int 21h ; Showing only the quotient, so it is a integer division
    jmp exit
    
    multiplication:
    
    mov al, cl
    mul ch
    
    ; The result of multiplication can be 2 digit, so following mechanism is needed to show the full answer
    mov ch, 0ah
    div ch
    mov ch, ah
    mov cl, al ; Saving quotient and remainder
    
    cmp cl, 0
    je digit2 ; If quotient is zero, the result is only 1 digit
    
    mov ah, 2
    mov dl, cl
    add dl, "0"
    int 21h ; Showing first digit
    
    digit2:
    mov ah, 2
    mov dl, ch
    add dl, "0"
    int 21h ; Showing second digit
    
    jmp exit
    addition:
    add ch, cl
    
    mov al, ch
    mov ah, 0 ; Result of addition kept in ax register
    
    ; The result of addition can be 2 digit, so following mechanism is needed to show the full answer
    mov ch, 0ah
    div ch
    mov ch, ah
    mov cl, al ; Saving quotient and remainder
    
    cmp cl, 0
    je digit2prime ; If quotient is zero, the result is only 1 digit
    
    mov ah, 2
    mov dl, cl
    add dl, "0"
    int 21h ; Showing first digit
    
    digit2prime:
    mov ah, 2
    mov dl, ch
    add dl, "0"
    int 21h ; Showing second digit
    jmp exit
    subtraction:
    
    sub cl, ch
    cmp cl, 0
    jge positive
    neg cl
    mov ah, 2
    mov dl, "-"
    int 21h ; If negative show a "-" sign
    
    positive:
    
    mov ah, 2
    mov dl, cl
    add dl, "0"
    int 21h
        
    exit:
    end start
ends

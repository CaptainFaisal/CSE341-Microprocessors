data segment
    inp db "ENTER HEX DIGIT: $"
    outp db "IN DECIMAL IT IS: $"
    err db "INVALID HEX DIGIT$"
ends

code segment
    start:
    
    mov ax, data
    mov ds, ax
    
    lea dx, inp
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h
    
    mov cl, al
    
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h ; CRLF
    
    cmp cl, "0"
    jl invalid
    cmp cl, "9"
    jle decimal
    
    cmp cl, "A"
    jl invalid
    cmp cl, "F"
    jle hex
    
    jmp invalid
    
    decimal:
    lea dx, outp
    mov ah, 9
    int 21h
    
    mov ah, 2
    mov dl, cl
    int 21h
    jmp exit
    
    hex:
    lea dx, outp
    mov ah, 9
    int 21h
    
    sub cl, 37h
    
    mov al, cl
    mov ah, 0 ; Input hex digit is now loaded in ax
    
    mov cl, 0ah
    
    div cl
    
    mov bl, al
    mov bh, ah ; Remainder and quotient is saved
    
    cmp bl, 0
    je digit2
    
    mov ah, 2
    mov dl, bl
    add dl, "0"
    int 21h
    
    digit2:
    
    mov ah, 2
    mov dl, bh
    add dl, "0"
    int 21h
    jmp exit
    
    invalid:
    lea dx, err
    mov ah, 9
    int 21h
    exit:
    end start
ends

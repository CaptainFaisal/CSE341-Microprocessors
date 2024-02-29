code segment
    start:

    mov ch, 80h
    mov bx, 0
    loop:
    mov ah, 2
    mov dl, ch
    int 21h
    mov dl, 20h
    int 21h
    
    inc bx
    mov ax, bx
    mov cl, 0ah
    div cl
    cmp ah, 0
    jne continue
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    continue:
    cmp ch, 0ffh
    je exit
    inc ch
    jmp loop
    
    exit:
    end start
ends

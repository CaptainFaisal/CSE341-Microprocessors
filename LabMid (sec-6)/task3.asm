code segment
    start:
    
    mov ah, 1
    int 21h
    mov cl, al
    sub cl, "0"
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h ; CRLF
    
    outer:
    cmp cl, 0
    jl exit
    
    mov ch, 0
    inner:
    cmp ch, cl
    jge innerEnd
    mov ah, 2
    mov dl, "*"
    int 21h
    inc ch
    jmp inner 
    
    innerEnd:
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h ; CRLF
    dec cl
    
    jmp outer
    
    exit:
    end start
ends

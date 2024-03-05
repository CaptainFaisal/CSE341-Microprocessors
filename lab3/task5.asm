code segment
    start:
    
    mov ah, 1
    int 21h
    
    cmp al, "A"
    jl exit
    cmp al, "Z"
    jg exit
    
    mov ah, 2
    mov dl, al
    int 21h
    
    exit:
    end start
ends

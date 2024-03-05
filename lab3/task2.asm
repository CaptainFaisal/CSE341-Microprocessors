code segment
    start:
    mov al, "!"
    mov bl, "*"
    
    cmp al, bl
    jl l1
    mov ah, 2
    mov dl, bl
    int 21h
    jmp exit
    l1:
    mov ah, 2
    mov dl, al
    int 21h
    
    exit:
    end start
ends

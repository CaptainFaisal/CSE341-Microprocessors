code segment
    start:
    
    mov cx, 80
    mov ah, 2
    mov dl, "*"
    star:
    int 21h
    loop star
    
    end start
ends

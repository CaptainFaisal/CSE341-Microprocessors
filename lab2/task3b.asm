code segment
    start:
    mov ah, 1
    int 21h
    
    mov ah, 2
    mov dl, al
    sub dl, "A"
    add dl, "a"
    int 21h
ends

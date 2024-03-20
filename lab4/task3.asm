code segment
    start:
    
    mov ah, 1
    mov cx, 5
    
    inputLoop:
    int 21h
    loop inputLoop  ; Input 5 character password
    
    mov ah, 2
    mov dl, 0dh
    int 21h         ; Carriage Return
    
    mov dl, "X"
    mov cx, 5
    
    overwriteLoop:
    int 21h
    loop overwriteLoop ; Overwriting the password
    
    end start
ends

code segment
    start:
    mov ah, 1
    int 21h
    mov cl, al ; Saving input character
    
    mov ah, 2
    mov dl, 0ah
    int 21h
 
    mov dl, cl
    sub dl, "A"
    add dl, "a"
    int 21h
ends
    

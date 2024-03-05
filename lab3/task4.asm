code segment
    start:
    
    mov al, 4
   
    cmp al, 1
    je dispo
    cmp al, 2
    je dispe
    cmp al, 3
    je dispo
    cmp al, 4
    je dispe
    
    dispo:
    mov ah, 2
    mov dl, "o"
    int 21h
    jmp exit
    dispe:
    mov ah, 2
    mov dl, "e"
    int 21h
    
    exit:
    end start
ends

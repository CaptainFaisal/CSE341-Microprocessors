code segment
    start:
    
    mov ah, 1
    int 21h
    
    cmp al, "y"
    je disp
    cmp al, "Y"
    je disp
    
    jmp exit
          
    disp:
    mov ah, 2
    mov dl, al
    int 21h
    
    exit:
    end start
ends

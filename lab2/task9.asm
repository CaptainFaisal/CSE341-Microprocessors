code segment
    start:
    
    mov al, 80h
    mov bl, 80h
    
    add al, bl
    
    ; CF=1, ZF=1, SF=0, OF=1, PF=1, AF=0, IF=1, DF=0
    
    end start
ends

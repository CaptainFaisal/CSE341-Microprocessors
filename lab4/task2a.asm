code segment
    start:
    
    mov cx, 1 ; Iterating variable
    mov ax, 0 ; Sum
    
    sumLoop:
    cmp cx, 148
    jg endLoop
    add ax, cx
    add cx, 3
    jmp sumLoop
    endLoop:
    
    end start
ends

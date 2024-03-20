code segment
    start:
    
    mov cx, 100 ; Iterating variable
    mov ax, 0 ; Sum
    
    sumLoop:
    cmp cx, 5
    jl endLoop
    add ax, cx
    sub cx, 5
    jmp sumLoop
    endLoop:
    
    end start
ends

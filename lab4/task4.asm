code segment
    start:
    
    mov ax, 5 ; M
    mov bx, 7 ; N
    
    mov cx, 0 ; MxN
    
    multiplyLoop:
    cmp bx, 0
    jle multiplyLoopEnd
    add cx, ax
    dec bx
    jmp multiplyLoop
    multiplyLoopEnd:
    
    end start
ends

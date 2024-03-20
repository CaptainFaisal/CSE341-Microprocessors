; Extended task3 (take 5 input character and replace by X immediately after each character input)

code segment
    start:
    
    mov cl, 0
    
    inputLoop:
    cmp cl, 5
    jge inputLoopEnd
    
    mov ah, 1
    int 21h
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    
    mov ch, cl
    
    overwriteLoop:
    cmp ch, 0
    jl overwriteLoopEnd
    mov dl, "X"
    int 21h
    dec ch
    jmp overwriteLoop
    overwriteLoopEnd:
    
    inc cl
    jmp inputLoop
    inputLoopEnd:
    
    end start
ends

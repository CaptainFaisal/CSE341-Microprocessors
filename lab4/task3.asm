code segment
    start:
    
    mov ax, 12
    
    cmp ax, 0
    jl negative
    je zero
    jg positive
    
    negative:
    mov bx, -1
    jmp exit
    zero:
    mov bx, 0
    jmp exit
    positive:
    mov bx, 1
    
    exit:
    end start
ends

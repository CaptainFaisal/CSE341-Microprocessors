code segment
    start:
    mov ah, 1
    int 21h
    sub al, "0"
    cmp al, 0
    jl exit
    cmp al, 3   
    jg l1
    mov ah, 2
    mov dl, "i"
    int 21h
    l1:
    cmp al, 6
    jg l2:
    mov ah, 2
    mov dl, "k"
    int 21h
    l2:
    cmp al, 9
    jg l3:
    mov ah, 2
    mov dl, "l"
    int 21h
    l3:
    cmp al, 10
    jne exit
    mov ah, 2
    mov dl, "m"
    int 21h          
    exit:
    end start
ends

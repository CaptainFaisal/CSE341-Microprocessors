data segment
    y db "The number is divisible by 5 and 11 $"
    n db "The number is not divisible by 5 and 11 $"
ends

code segment
    start:
    mov ax, data
    mov ds, ax
    
    mov ax, 110 ; Number to check
    mov ch, 55
    div ch
    cmp ah, 0
    jne no
    lea dx, y
    mov ah, 9
    int 21h
    jmp exit
    no:
    lea dx, n
    mov ah, 9
    int 21h
    exit:
    end start
ends
    

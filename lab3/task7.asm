data segment
    o db "Odd$"
    e db "Even$"
ends

code segment
    start:
    mov ax, data
    mov ds, ax
    
    mov ax, 15 ; Number to check
    
    mov cl, 2
    div cl
    cmp ah, 0
    jne odd
    lea dx, e
    mov ah, 9
    int 21h
    jmp exit ; Even case
    
    odd:
    lea dx, o
    mov ah, 9
    int 21h  ; Odd case
    
    exit:
    end start
ends

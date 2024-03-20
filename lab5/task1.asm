data segment
    prompt1 db "Input the length of name: $"
    prompt2 db "Input the name: $"
    nm db 10 dup(?)
ends

code segment
    start:
    
    mov ax, data
    mov ds, ax
    
    lea dx, prompt1
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h
    
    mov cl, al
    sub cl, "0"
    mov ch, 0    ; cx=00cl
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    lea dx, prompt2
    mov ah, 9
    int 21h
        
    mov bx, cx
    mov ah, 1
    lea si, nm
    
    mov ah, 1
    
    inputLoop:
    int 21h
    mov [si], al
    inc si
    loop inputLoop
    
        
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    mov cx, bx
    mov ah, 2
    lea si, nm
    displayLoop:
    mov dl, [si]
    int 21h
    inc si
    loop displayLoop
    
    end start
ends

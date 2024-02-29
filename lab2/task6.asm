data segment
    m db "ENTER THREE INITIALS: $"
ends

code segment
    start:
    mov ax, data
    mov ds, ax
    
    lea dx, m
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h
    
    mov cl, al
    
    int 21h
    
    mov ch, al
    
    int 21h
    
    mov bl, al
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h ; CRLF
    
    mov dl, cl
    int 21h
    
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    mov dl, ch
    int 21h
    
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    mov dl, bl
    int 21h
    
    end start
ends

data segment
    m1 db "THE SUM OF $"
    m2 db " AND $"
    m3 db " IS $"
ends

code segment
    start:
    
    mov ax, data
    mov ds, ax
    
    mov ah, 2
    mov dl, "?"
    int 21h
    
    mov ah, 1
    int 21h  ; Input 1
    mov cl, al
    sub cl, "0" 
    int 21h  ; Input 2
    mov ch, al
    sub ch, "0"
    
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h ; CRLF
    
    lea dx, m1
    mov ah, 9
    int 21h
    
    mov ah, 2
    mov dl, cl
    add dl, "0"
    int 21h
    
    lea dx, m2
    mov ah, 9
    int 21h
    
    mov ah, 2
    mov dl, ch
    add dl, "0"
    int 21h
    
    lea dx, m3
    mov ah, 9
    int 21h
    
    add cl, ch
    
    mov ah, 2
    mov dl, cl
    add dl, "0"
    int 21h
    
    end start
ends
    

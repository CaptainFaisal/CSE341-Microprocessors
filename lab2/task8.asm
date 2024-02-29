data segment
    seg db "**********$"
ends

code segment
    start:
    
    mov ax, data
    mov ds, ax
    
    lea dx, seg
    mov ah, 9
    int 21h
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    lea dx, seg
    mov ah, 9
    int 21h
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    lea dx, seg
    mov ah, 9
    int 21h
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    lea dx, seg
    mov ah, 9
    int 21h
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    lea dx, seg
    mov ah, 9
    int 21h
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    lea dx, seg
    mov ah, 9
    int 21h
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    lea dx, seg
    mov ah, 9
    int 21h
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    lea dx, seg
    mov ah, 9
    int 21h
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    lea dx, seg
    mov ah, 9
    int 21h
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    lea dx, seg
    mov ah, 9
    int 21h

    end start
ends

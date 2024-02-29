data segment
    disp db "Please insert a character: $"
ends

code segment
    start:
    mov ax, data
    mov ds, ax
    lea dx, disp
    mov ah, 9
    int 21h ; Showing prompt
    
    mov ah, 1
    int 21h ; Taking input
    
    mov cl, al ; Saving the input
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h ; CRLF
    
    mov dl, cl
    int 21h ; Showing the character
    
        
    exit:
    end start
ends

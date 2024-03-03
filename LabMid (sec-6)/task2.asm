data segment
    prompt db "Enter integer (0-9): $"
    st db "Starting to check$"
    y db "Divisible by 5$"
    n db "Not divisible by 5$"
ends

code segment
    start:
    
    mov ax, data
    mov ds, ax
    
    lea dx, prompt
    mov ah, 9
    int 21h ; Prompting for taking input
    
    mov ah, 1
    int 21h
    
    mov cl, al ; Saving the input
    sub cl, "0"
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h ; CRLF
    
    lea dx, st
    mov ah, 9
    int 21h ; Starting to check
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h ; CRLF
    
    mov ch, 5
    mov ah, 0
    mov al, cl
    
    div ch
    
    cmp ah, 0
    je yes
    jne no
    
    yes:
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

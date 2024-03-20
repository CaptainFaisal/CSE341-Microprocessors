data segment
    hex db "ENTER A HEX DIGIT: $"
    decimalout db "IN DECIMAL IT IS $"
    ask db "DO YOU WANT TO DO IT AGAIN? $"
    error db "ILLEGAL CHARACTER - ENTER 0..9 OR A..F: $"
ends

code segment
    start:
    mov ax, data
    mov ds, ax
    
    repeat:
    
    lea dx, hex
    mov ah, 9
    int 21h ; Prompting for taking hex input
    
    mov ah, 1
    int 21h ; Taking the input
    
    mov cl, al ; Saving that input
    
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h ;CRLF
    
    cmp cl, "0"
    jl err
    cmp cl, "9"
    jle valid1
    cmp cl, "A"
    jl err
    cmp cl, "F"
    jle valid2
    
    
    
    err:
    lea dx, error
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h
    
    mov cl, al
    
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h ;CRLF
    
    cmp cl, "0"
    jl err
    cmp cl, "9"
    jle valid1
    cmp cl, "A"
    jl err
    cmp cl, "F"
    jle valid2
    
    
    valid1:
    sub cl, 30h
    jmp continue
    valid2:
    sub cl, 37h
    continue:
    lea dx, decimalout
    mov ah, 9
    int 21h
    
  
    mov al, cl
    mov ah, 0
    mov ch, 0ah
    
    div ch
    
    mov ch, ah
    mov cl, al
    
    cmp cl, 0
    
    je l1
    
    mov ah, 2
    mov dl, cl
    add dl, "0"
    int 21h
    
    l1:
    mov ah, 2
    mov dl, ch
    add dl, "0"
    int 21h
    
    
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h ;CRLF
    
    lea dx, ask
    mov ah, 9
    int 21h ; Asking if repeat
    
    mov ah, 1
    int 21h
    
    mov cl, al
    
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h ;CRLF
    
    cmp cl, "y"
    
    je repeat
    
    cmp cl, "Y"
    
    je repeat
    
    
        
    exit:
    end start
ends

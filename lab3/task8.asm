data segment
    inp db "Input a character: $"
    y db "It's a vowel$"
    n db "It isn't a vowel$"
ends

code segment
    start:
    mov ax, data
    mov ds, ax
    
    mov ah, 9
    lea dx, inp
    int 21h
    
    mov ah, 1
    int 21h
    
    mov cl, al
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h ; CRLF
    
    cmp cl, "a"
    je vowel
    cmp cl, "A"
    je vowel
    cmp cl, "e"
    je vowel
    cmp cl, "E"
    je vowel
    cmp cl, "i"
    je vowel
    cmp cl, "I"
    je vowel
    cmp cl, "o"
    je vowel
    cmp cl, "O"        
    je vowel
    cmp cl, "u"
    je vowel
    cmp cl, "U"
    je vowel
    
    lea dx, n
    mov ah, 9
    int 21h
    jmp exit
    
    vowel:
    lea dx, y
    mov ah, 9
    int 21h
    
    exit:
    end start
ends

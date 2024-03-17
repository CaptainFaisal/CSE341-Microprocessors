data segment
    input db "Input 3 number (One digit each): $"
    max db "Maximum number is $"
    min db "Minimum number is $"
ends

code segment
    start:
    mov ax, data
    mov ds, ax
    
    lea dx, input
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
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h ; CRLF
    
    cmp ch, cl
    jle l1
    cmp ch, bl
    jle maxC
    jmp maxA
    l1:
    cmp cl, bl
    jle maxC
    jmp maxB
 
    maxA:
    mov ah, 9
    lea dx, max
    int 21h
    mov ah, 2
    mov dl, ch
    int 21h
    jmp minStart
    maxB:
    mov ah, 9
    lea dx, max
    int 21h
    mov ah, 2
    mov dl, cl
    int 21h
    jmp minStart
    maxC:
    mov ah, 9
    lea dx, max
    int 21h
    mov ah, 2
    mov dl, bl
    int 21h
    
    minStart:
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h ; CRLF
    
    cmp ch, cl
    jge l2
    cmp ch, bl
    jge minC
    jmp minA
    l2:
    cmp cl, bl
    jge minC
    jmp minB
    
    minA:
    mov ah, 9
    lea dx, min
    int 21h
    mov ah, 2
    mov dl, ch
    int 21h
    jmp exit
    minB:
    mov ah, 9
    lea dx, min
    int 21h
    mov ah, 2
    mov dl, cl
    int 21h
    jmp exit
    minC:
    mov ah, 9
    lea dx, min
    int 21h
    mov ah, 2
    mov dl, bl
    int 21h
    exit:
    end start
ends
    

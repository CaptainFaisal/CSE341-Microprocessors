data segment
    prompt db "Enter month: $"
    err db "Invalid month$"
    m db " days$"
ends

code segment
    start:
    mov ax, data
    mov ds, ax
    
    lea bx, prompt
    mov ah, 9
    int 21h
    
    ; Input 2 digit number (e.g. 01, 09, 11, etc.)
    mov ah, 1
    int 21h
    sub al, "0"
    mov bl, al

    int 21h
    sub al, "0"
    mov cl, al

    mov al, bl
    mov ah, 0
    mov bl, 10
    mul bl
    add al, cl

    cmp al, 1
    je jan
    cmp al, 2
    je feb
    cmp al, 3
    je mar
    cmp al, 4
    je apr
    cmp al, 5
    je may
    cmp al, 6
    je jun
    cmp al, 7
    je jul
    cmp al, 8
    je aug
    cmp al, 9
    je sep
    cmp al, 10
    je oct
    cmp al, 11
    je nov
    cmp al, 12
    je dec
    jmp invalid

    jan:
    mov bx, 31
    jmp print
    feb:
    mov bx, 28
    jmp print
    mar:
    mov bx, 31
    jmp print
    apr:
    mov bx, 30
    jmp print
    may:
    mov bx, 31
    jmp print
    jun:
    mov bx, 30
    jmp print
    jul:
    mov bx, 31
    jmp print
    aug:
    mov bx, 31
    jmp print
    sep:
    mov bx, 30
    jmp print
    oct:
    mov bx, 31
    jmp print
    nov:
    mov bx, 30
    jmp print
    dec:
    mov bx, 31
    jmp print

    print:
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    mov ax, bx
    mov cl, 10
    div cl
    add ah, "0"
    add al, "0"
    mov ch, ah
    mov cl, al
    mov ah, 2
    mov dl, cl
    int 21h
    mov dl, ch
    int 21h
    lea dx, m
    mov ah, 9
    int 21h
    jmp exit

    invalid:
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    lea dx, err
    mov ah, 9
    int 21h

    exit:
    end start
ends


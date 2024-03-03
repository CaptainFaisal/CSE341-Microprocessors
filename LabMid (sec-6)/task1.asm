code segment
    start:
    mov al, 100
    sub al, 11
    add al, 1
    mov ah, 2
    mul ah
    mov dx, 0
    mov bx, 3
    div bx ; AX contains answer
    end start
ends

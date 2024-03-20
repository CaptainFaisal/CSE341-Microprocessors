data segment
    prompt db "Enter day of the week: $"
    sat db "Saturday$"
    sun db "Sunday$"
    mon db "Monday$"
    tue db "Tuesday$"
    wed db "Wednesday$"
    thu db "Thursday$"
    fri db "Friday$"
ends

code segment
    start:
    mov ax, data
    mov ds, ax

    mov ah, 9
    lea dx, prompt
    int 21h

    mov ah, 1
    int 21h

    mov cl, al
    sub cl, "0"

    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h ; CRLF

    cmp cl, 1
    je saturday
    cmp cl, 2
    je sunday
    cmp cl, 3
    je monday
    cmp cl, 4
    je tuesday
    cmp cl, 5
    je wednesday
    cmp cl, 6
    je thursday
    cmp cl, 7
    je friday

    saturday:
        lea dx, sat
        jmp display
    sunday:
        lea dx, sun
        jmp display
    monday:
        lea dx, mon
        jmp display
    tuesday:
        lea dx, tue
        jmp display
    wednesday:
        lea dx, wed
        jmp display 
    thursday:
        lea dx, thu
        jmp display 
    friday:
        lea dx, fri
        jmp display
    display:
        mov ah, 9
        int 21h
    end start
ends

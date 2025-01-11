; set data segment to code segment:

jmp start

start:
    mov ax, cs
    mov ds, ax

    ; clear screen
    mov ah, 0
    mov al, 3
    int 10h

    ; read current temperature
    in al, 125

    ; display current temperature label
    mov dx, offset current_msg
    mov ah, 9
    int 21h
    
    in al, 125
    
    ; display current temperature 
    mov bl, al
    call display_number

    ; display target temperature label
    mov dx, offset target_msg
    mov ah, 9
    int 21h

    ; display target temperature
    mov al, 60
    call display_number

    ; wait for character input
    mov ah, 0
    int 16h

    ; check if '+' key is pressed
    cmp al, '+'
    je plus_pressed

    ; check if '-' key is pressed
    cmp al, '-'
    je minus_pressed

    ; if neither '+' nor '-', continue loop
    jmp start

plus_pressed:
    ; turn heater on
    mov al, 1
    out 127, al
    jmp start

minus_pressed:
    ; turn heater off
    mov al, 0
    out 127, al
    jmp start

; procedure to display number in al
display_number:
    ; convert number to decimal
    mov ah, 0
    mov cl, 10
    div cl

    ; display tens digit
    add al, '0'
    mov dl, al
    mov ah, 2
    int 21h

    ; display ones digit
    mov al, ah
    add al, '0'
    mov dl, al
    mov ah, 2
    int 21h

    ret

; message strings
current_msg db 'current temp: $'
target_msg db 13,10,'target temp: $'

include magshimim.inc
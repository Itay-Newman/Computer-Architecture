org 100h

jmp start

a dd 5
b dd 3
c dd 2
result dd 0

PROC mystery
    push bp
    mov bp, sp
    mov ax, [bp+6]
    imul ax
    mov dx, ax
    mov ax, [bp+4]
    shl ax, 2
    imul [bp+8]
    sub dx, ax
    mov ax, dx
    pop bp
    ret
    
ENDP mystery


start:
    mov ax, a
    push ax
    mov ax, b
    push ax
    mov ax, c
    push ax
    
    call mystery
    
    add sp, 12
    mov [result], ax
    
mov ah, 0
int 16h
ret

include magshimim.inc
org 100h

jmp start

x db 0x7F
y db 0x80

start:
    mov al, x
    call print_num
    PRINTN
    push ax
    mov al, y
    call print_num
    PRINTN
    PRINTN
    push ax
    
    call swap
    pop ax
    pop bx
    
    call print_num
    PRINTN
    mov ax, bx
    call print_num
    PRINTN
    
    mov ah, 0
    int 16h
    ret

    
temp EQU -2;local variable
PROC Swap
    push bp
    mov bp, sp
    
    sub sp, 2 
    pusha
    ;change places with temp
    mov bx, [bp + 4]
    mov si, [bp + 6]
    mov dx, [bx]
    mov [bp + temp], dx
    mov dx, [si]
    mov [bx], dx
    mov dx, [bp + temp]
    mov [si], dx          
    
    popa    
    mov sp, bp
    pop bp
    ret
ENDP Swap

include magshimim.inc
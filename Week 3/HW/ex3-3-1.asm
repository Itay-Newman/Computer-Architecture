org 100h

jmp start


start:
    mov ax, 10
    mov bx, ax
        woop:
            dec bx
            mul bx
    
            cmp bx, 1
            jne woop 
    call print_num

mov ah, 0
int 16h
ret

include magshimim.inc
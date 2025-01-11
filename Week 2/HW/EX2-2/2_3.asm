org 100h     

mov al, 15
mov bl, 11010011b

mov cl, al
mov al, bl
mov bl, cl

mov ah, 0
int 16h
ret
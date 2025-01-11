org 100h     

mov al, 15
mov bl, 11010011b
xchg al, bl
 

mov ah, 0
int 16h
ret
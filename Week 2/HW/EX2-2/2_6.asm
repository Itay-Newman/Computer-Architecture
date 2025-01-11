org 100h     

mov ax, 1011b
mov bx, 1f4h
add ax, bx
mov dx, ax   

mov ah, 0
int 16h
ret
org 100h     

mov bx, 10
mov cx, 4
mov ax, bx
mul cx
mov dx, ax

mov ah, 0
int 16h
ret
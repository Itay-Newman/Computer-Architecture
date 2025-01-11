org 100h     

mov bx, 1010
not bx
add bx, 1

mov ah, 0
int 16h
ret
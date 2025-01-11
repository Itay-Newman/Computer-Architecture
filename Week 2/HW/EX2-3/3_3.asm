org 100h     
         
mov bx, 2         
;shl bx, 5

mov ax, bx
mov cx, 40
loop:
add bx, ax
Loop loop


mov ah, 0       
int 16h
ret
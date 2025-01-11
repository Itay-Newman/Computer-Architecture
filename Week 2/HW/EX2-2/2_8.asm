org 100h     

mov ax, 1
mov cx, 13

shl ax, cl

mov ah, 0
int 16h
ret
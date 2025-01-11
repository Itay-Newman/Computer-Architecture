org 100h     

mov al, 0f2h
mov bl, al  ;The error occurred because `bx` and `al` are different sizes. Changing `bx` to `bl` fixes this since both are 8-bit

mov ah, 0
int 16h
ret
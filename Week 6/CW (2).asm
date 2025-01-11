org 100h


jmp start

start:
    mov ah, 1
    int 21h
    
    push ax
    call printChar

printChar PROC
    push bp
	mov bp, sp
	mov dl, [bp+4]
	mov ah, 2
	int 21h 
	pop bp
	retn 2 
printChar ENDP
    
mov ah, 0;
int 16h
ret


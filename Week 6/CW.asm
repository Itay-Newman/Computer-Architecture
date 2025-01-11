ORG 100h            
    jmp start
    
str1 DB "itay newman" 
str1_len EQU 11

start:
	mov cx,str1_len
	mov si,OFFSET str1  
	
doloop:
	mov al,[si]
	inc si
	mov ah,0h
	push ax
	call printChar
	loop doloop
    jmp finish
    
    
printChar PROC
    push bp
	mov bp, sp
	mov dl, [bp+4]
	mov ah, 2
	int 21h 
	pop bp
	retn 2 
printChar ENDP

finish: 
mov al,0
mov ah,4ch
int 21h    ;return 0
;ret return
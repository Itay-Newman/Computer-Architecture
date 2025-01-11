org 100h

mySafe:
    mov dx, 5
    mov ax, [5768h]    
    mov bx, 7
    mov word [180h], 2
    push dx
    mul word [180h]     
    pop dx
    mov [180h], bx
    push ax
    dec bx              
    mov cx, dx          
    mov ax, dx          
loop1:
    add bx, ax          
    loop loop1
    dec bx
    pop ax
    add ax, bx
    mul word [180h]     
    cmp ax, 350
    jne mySafe          
    mov ax, 4C00h       
    int 21h             
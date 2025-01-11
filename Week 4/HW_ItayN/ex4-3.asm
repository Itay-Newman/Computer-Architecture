org  100h

jmp main    

start:
    array dw 8, 3, 11, 19, 2, 6, 3 
    
temp EQU -2;local variable
PROC Swap
    push bp
    mov bp, sp
    
    sub sp, 2 
    pusha
    ;change places with temp
    mov bx, [bp + 4]
    mov si, [bp + 6]
    mov dx, [bx]
    mov [bp + temp], dx
    mov dx, [si]
    mov [bx], dx
    mov dx, [bp + temp]
    mov [si], dx          
    
    popa    
    mov sp, bp
    pop bp
    ret
ENDP Swap

minIndex EQU -2
min EQU -4
PROC FindMin
    push bp
    mov bp, sp
    sub sp, 4
    pusha
    mov [bp + minIndex], 0          
    mov bx, [bp + 6]
    mov cx, [bp + 4]
    dec cx
    mov dx, [bx]
    mov [bp + min], dx
    
    mov si, 2
    ;if it's the last member that won't go in
    cmp cx, 0 
    JE last
        ;finds the minimum term and its index   
        min_loop:
            mov dx, [bx + si] 
            cmp dx, [bp + min]
            JGE not_min
                mov [bp + min], dx
                mov [bp + minIndex], si
            not_min:
            add si, 2
        loop min_loop    
    last:    
    popa                       
    mov ax, [bp + minIndex]    
    mov sp, bp                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    pop bp
    ret
ENDP FindMin

PROC SortArray
    push bp     
    mov bp, sp
    pusha
    mov bx, [bp + 6];first index array
    mov cx, [bp + 4];length array
    
    mov si, 0;index for array
    ;sorted loop
    sort_loop:
        lea ax, [bx + si]
        push ax
        push cx
        call FindMin
        pop cx
        pop dx
        add ax, si
        ;if the minimum index is the current index
        cmp ax, si;ax this min index
        JE didnt_sort
            mov di, ax
            lea ax, [bx + di]
            push ax
            lea ax, [bx + si]
            push ax
            call swap
            pop ax
            pop ax        
        didnt_sort:
        add si, 2
        
    loop sort_loop
    popa
    mov sp, bp
    pop bp
    ret
ENDP SortArray    

size EQU 7
main:
    push offset array
    push size
    call SortArray
    mov ax, [bx]
    mov cx, size
    mov si, 0
    lea bx, array
    ;loop for print array after sorting
    print_loop:
        mov ax, [bx + si]
        call print_num
        PRINT " "
        add si, 2    
    loop print_loop
mov     ah, 0
int     16h
ret

include magshimim.inc
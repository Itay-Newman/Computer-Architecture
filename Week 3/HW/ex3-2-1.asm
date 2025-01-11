org 100h


jmp start

start:
    mov ah, 1
    mov al, 2
    cmp ah, al

    jg ah_bigger 
    jl al_bigger

    ah_bigger:
        PRINTN      "AH is bigger"
    
    al_bigger: 
        PRINTN      "AL is bigger"
    
    mov     ah, 0
    int     16h
    ret
    
include magshimim.inc   
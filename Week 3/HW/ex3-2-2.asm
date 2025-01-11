org 100h


jmp start

start:
    mov ah, 1
    mov al, 1
    cmp ah, al

    jg ah_bigger 
    jl al_bigger
    je equal

    ah_bigger:
        PRINTN      "AH is bigger"
    
    al_bigger: 
        PRINTN      "AL is bigger"
    
    equal:
        PRINTN      "AL and AH are equal"
    
    mov     ah, 0
    int     16h
    ret
    
include magshimim.inc
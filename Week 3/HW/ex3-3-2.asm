org 100h

mov ax, 64h
mov cx, 0
mov dx, 16

bit_count_loop:
    test ax, 1 ;check if ax is 1
    jz skip_increment
    inc cx
skip_increment:
    shr ax, 1
    dec dx
    jnz bit_count_loop

mov ax, cx
call print_num

mov ah, 0
int 16h
ret

include magshimim.inc

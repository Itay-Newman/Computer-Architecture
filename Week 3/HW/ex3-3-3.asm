org 100h

array db 1, 99 dup(0)
row db 0
col db 0
size db 10


mov ah, 0
int 16h
ret

include magshimim.inc
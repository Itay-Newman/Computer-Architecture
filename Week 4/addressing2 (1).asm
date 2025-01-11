org  100h

jmp start

start:  

; We first push a "magic" number to the stack
; so we can check it's ok at the end

        mov     ax,23232
        push    ax
        
; We now put some interesting values in some
; of the registers
        
        mov     ax,1234
        mov     di,'X'
        mov     cx,'Y'
        
; We now use the instruction PUSHA
; READ about it in the book/instruction manual,
; and DEBUG the code to understand it!

        pusha

; We now destroy our precious values
        xor     ax,ax
        xor     di,di
        xor     cx,cx
        
; WRITE YOUR CODE HERE:
; PRINT 1234,'X','Y'

        popa
        
        call    print_num
        PRINTN
        
   
; write some more code here

        mov ax, di
       
        call	PRINT_AL_CHR
        PRINTN
        
; write some more code here
                                
        mov ax, cx                        

        call 	PRINT_AL_CHR
        PRINTN        
        
; Now restore the stack WITHOUT USING POPA
; write your code here

        pusha


; We now check the stack - this MUST print out our
; "magic" number 23232               
        
        mov bx, sp
        mov ax, [bx + 16]
        
        call    print_num
        PRINTN
        
        
        mov     ah, 0 
        int     16h 
        

ret
include magshimim.inc

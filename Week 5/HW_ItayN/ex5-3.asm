org  100h

jmp main    

start:
    P dw 7
    Q dw 11
    totient dw ?
    publicKey dw 7 

;function to calculate the totient
PROC CalculateTotient
    push bp
    mov bp, sp
        
    mov ax, [bp + 6];P
    dec ax
    mov bx, [bp + 4];Q
    dec bx
    mul bx

    mov sp, bp
    pop bp
    ret
ENDP CalculateTotient

;function to check whether the number is prime
PROC IsPrime
    push bp
    mov bp, sp
    
    ;checks whether the number is prime
    mov bx, [bp + 4];the public key
    cmp bx, 1
    JBE notPrime
    cmp bx, 2
    JE prime
    cmp bx, 3
    JE prime
    ;checking whether it is divisible by 2 without a remainder
    mov ax, bx
    mov cx, 2
    div cx
    cmp dx, 0
    JE notPrime
    ;checking whether it is divisible by 3 without a remainder
    mov ax, bx 
    mov cx, 3
    div cx 
    cmp dx, 0
    JE notPrime
    mov cx, 5
    ;loop that goes through all the numbers that can be a prime divisor of public key
    loop_prime:
        ;checking whether it is divisible by cx without a remainder
        mov ax, bx
        div cx
        cmp dx, 0
        JE notPrime
        ;checking whether it is divisible by cx + 2 without a remainder
        mov ax, bx
        mov si, cx
        add si, 2
        div si
        cmp dx, 0
        JE notPrime
        mov ax, cx
        mul cx
        add cx, 6   
        cmp ax, bx
        JBE loop_prime
    prime:
        mov ax, 1
        jmp finish_proc
    notPrime:
        mov ax, 0    
    finish_proc:
        
    mov sp, bp
    pop bp
    ret
ENDP IsPrime    

;function to check the public key
PROC CheckPublicKey
    push bp
    mov bp, sp
        
    mov cx, [bp + 4];the public key
    ;checking whether it is prime
    push cx
    call IsPrime
    pop cx
    mov bx, [bp + 6];the totient
    cmp ax, 0
    JE invalidKey
    ;checking whether it is greater than the totient
    cmp bx, cx
    JBE invalidKey
    ;checking whether the Totient modulo the public key is equal to zero
    mov ax, bx
    div cx
    cmp dx, 0
    JE invalidKey
    
    validKey:
        mov ax, 1
        jmp end_check
    invalidKey:
        mov ax, 0
    end_check:
        
    mov sp, bp
    pop bp
    ret
ENDP CheckPublicKey    

;function to create the private key
PROC CreatePrivateKey
    push bp
    mov bp, sp
    
    mov bx, [bp + 6]; the totient
    mov cx, [bp + 4];the public key
    mov si, 0
    ;loop to search for the private key
    loop_private:
        inc si
        mov ax, cx
        mul si
        div bx
        cmp dx, 1
        JNE loop_private   
    mov ax, si
    
    mov sp, bp
    pop bp
    ret
ENDP CreatePrivateKey

main:
    push P
    push Q
    call CalculateTotient
    pop Q
    pop P
    mov totient, ax
    push totient
    push publicKey
    call CheckPublicKey
    pop publicKey
    pop totient
    cmp ax, 0
    JE notKey
    push totient
    push publicKey
    call CreatePrivateKey
    pop publicKey
    pop totient
    PRINT "The private key: "
    call print_num
    jmp end
    notKey:
        PRINT "There is no private key"
end:
        
mov     ah, 0
int     16h
ret

include magshimim.inc
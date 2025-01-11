org 100h           

jmp start          


div_zero:
    pusha               
    mov ah, 09h         
    lea dx, error_msg   ; Load the address of the error message into DX
    int 21h             
    popa                
    iret                

start:
    cli                 ; Disable interrupts while modifying the IVT
    mov ax, 0h          
    mov es, ax          ; Set ES to the desired segment
    
    mov es:[0h], offset div_zero   ; Set the offset of ISR at IVT entry 0
    mov es:[2h], cs                   ; Set the segment of ISR at IVT entry 0
    sti                 ; Enable interrupts again

    ; Perform division by zero operation
    mov ax, 1           
    mov bx, 0           
    div bx
                  
    mov ah, 0
    int 16h
    ret                 

error_msg db 'ERROR: division by zero$', 0
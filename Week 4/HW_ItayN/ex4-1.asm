org 100h

jmp start

x dw 0x7F
y dw 0x80

start:
    mov ax, x         ; Load x into AX
    push ax           ; Push first parameter onto stack
    mov ax, y         ; Load y into AX
    push ax           ; Push second parameter onto stack

    call min          ; Call min function

    call print_NUM    ; Print the result
    PRINTN            ; Print newline

    mov ah, 0
    int 16h           ; Wait for keypress
    ret

min PROC
    push bp           ; Save base pointer
    mov bp, sp        ; Set stack frame

    mov ax, [bp + 4]  ; Load first parameter into AX
    mov bx, [bp + 6]  ; Load second parameter into BX

    cmp ax, bx        ; Compare parameters
    jbe ax_min        ; If AX <= BX, skip to ax_min
    mov ax, bx        ; Otherwise, AX = BX

ax_min:
    mov sp, bp        ; Reset stack pointer to base pointer
    pop bp            ; Restore base pointer
    ret 4             ; Clean up 4 bytes of parameters (2 words)

min ENDP

include magshimim.inc

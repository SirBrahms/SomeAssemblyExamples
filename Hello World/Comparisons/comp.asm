global _start

section .data
    msgEq db "ecx and 99 are equal!", 0x0A
    lenEq equ $ - msgEq
    msgNEQ db "ecx and 99 are not equal!", 0x0A
    lenNEQ equ $ - msgNEQ

section .text
_start:
    mov ecx, 99 ; move 99 to ecx
    cmp ecx, 99 ; compare the value stored in ecx to 99
    je equal
    jne nequal
    jmp _end

equal:
    mov eax, 4 ; system_write
    mov ebx, 1 
    mov ecx, msgEq ; string to write
    mov edx, lenEq ; length of the string
    int 0x80
    jmp _end
    
nequal:
    mov eax, 4 ; system_write
    mov ebx, 1 
    mov ecx, msgNEQ ; string to write
    mov edx, lenNEQ ; length of the string
    int 0x80
    jmp _end

_end:
    mov eax, 1 ; system_exit
    mov ebx, 0 ; exit code = 0
    int 0x80 ; call kernel -> exit
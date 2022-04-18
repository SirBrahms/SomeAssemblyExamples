global _start

section .data
    msg db "Hello World!", 0x0A
    len equ $ - msg


section .text
_start:
    mov eax, 4 ; sys_write
    mov ebx, 1 ; stdout
    mov ecx, msg ; string to write
    mov edx, len ; lenght of the string
    int 0x80 ; call kernel -> write
    jmp _end

_end:
    mov eax, 1 ; preparing for exit
    mov ebx, 0 ; setting exit code
    int 0x80 ; calling the kernel -> exit
global _start

section .data
    prompt db "Please enter a number", 0x0A
    promptLen equ $ - prompt
    finalmsg db "The answer is: "
    finalmsgLen equ $ - finalmsg

section .bss
    num resb 5 ; reserve bytes for the number

section .text
_start:
    ; Print Prompt
    mov eax, 4 ; system_write
    mov ebx, 1 ; stdout
    mov ecx, prompt ; string to write
    mov edx, promptLen ; Lenght of string to write
    int 0x80 ; call kernel
    
    ; Get Input
    mov eax, 3 ; system_read (input)
    mov ebx, 2 ; stdin
    mov ecx, num ; variable to save input into
    mov ebx, 5 ; because the number was initialised to 5 bytes in .bss
    int 0x80 ; call kernel
    
    
    ; Print finalmsg
    mov eax, 4 ; system_write
    mov ebx, 1 ; stdout
    mov ecx, finalmsg ; string to write
    mov edx, finalmsgLen ; lenght of string to write
    int 0x80 ; call kernel
    
    ; Print number
    mov eax, 4 ; system_write
    mov ebx, 1 ; stdout
    mov ecx, num ; string to write
    mov edx, 5 ; because the number was initialised to 5 bytes in .bss
    
    jmp _end ; jump to the end of the program

_end:
    mov eax, 1 ; system_exit
    mov ebx, 0 ; exit code = 0
    int 0x80 ; call kernel -> exit
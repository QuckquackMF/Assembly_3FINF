section .data
    msg db "sum: "
    len equ $ - msg
    lf db 0x0A
    num1 dd 11
    num2 dd 15
    
section .bss
    sum resb 40
    sum_len resd 1

section .text
	global _start

_start:
mov eax, [num1]
mov ebx, [num2]
add eax, ebx

mov edi, sum
call inttostring
sub edi, sum
mov [sum_len], edi

mov ecx, msg
mov edx, len
mov ebx, 1
mov eax, 4
int 0x80

mov eax, 4
mov ebx, 1
mov ecx, sum
mov edx, [sum_len]
int 0x80

mov eax, 4
mov ebx, 1
mov ecx, lf
mov edx, 1
int 0x80

mov eax, 1
mov ebx, 0 
int 80h

inttostring:
    xor ecx, ecx
    mov ebx, 10
    .LL1:
    xor edx, edx
    div ebx 
    push dx 
    inc ecx
    test eax, eax 
    jnz .LL1 

    .LL2: 
    pop dx 
    or dl, '0'
    mov [edi], dl 
    inc edi  
    loop .LL2 

    mov byte [edi], 0  
    ret       
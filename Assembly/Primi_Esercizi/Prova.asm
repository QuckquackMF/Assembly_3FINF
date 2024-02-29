section .data
msg db "sottrazione: "
len equ $ - msg

section .bss
sot resb 1

section .text
global _start

_start:
mov eax, 53
mov ebx, 1

sub eax, ebx
mov [sot], eax

mov ecx, msg
mov edx, len
mov ebx, 1
mov eax, 4
int 80h

mov ecx, sot
mov edx, 1
mov ebx, 1
mov eax, 4
int 80h

mov eax, 1
mov ebx, 0 
int 80h
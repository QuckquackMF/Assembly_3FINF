section .data
msg db " risultato: "
len equ $ - msg

section .bss
sum resb 1
result resb 1

section .text
global _start

_start:
mov	eax, '3'
sub	eax, '0'
mov	ebx, '4'
sub	ebx, '0'

add	eax, ebx
add	eax, '0'
mov	[sum], eax

mov	ecx,msg
mov	edx, len
mov	ebx,1
mov	eax, 4
int	80h

mov	ecx, sum
mov	edx, 1
mov	ebx, 1
mov	eax, 4
int	80h

mov al, '3'
sub al, '0' 
mov bl, '2'
sub bl, '0'

mul bl 
add al, '0'
mov [result], al

mov eax, 4
mov ebx, 1
mov ecx, msg
mov edx, len
int 80h

mov eax, 4
mov ebx, 1
mov ecx, result
mov edx, 1
int 80h
	
mov	eax, 1
mov	ebx, 0
int	80h
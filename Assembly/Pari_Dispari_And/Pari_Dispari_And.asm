section .data
sum_msg db "Il risultato della somma e'", 0xA
len_sum equ $ - sum_msg

new_line db 0xA
len_nl equ $ - new_line

odd_msg db "Il numero è dispari", 0xA
len_odd_msg equ $ - odd_msg

even_msg db "Il numero è pari", 0xA
len_even_msg equ $ - even_msg

num1 db 5
num2 db 1

section .bss
sum resb 1
mol resb 1

section .text
global _start

_start:
	mov eax, [num1]
	mov ebx, [num2]

	add eax, ebx
	add eax, '0'
	mov [sum], eax
	
	
	

	mov eax, 4
	mov ebx, 1
	mov ecx, sum_msg
	mov edx, len_sum
	int 80h

  mov eax, [sum]
	sub eax, 0	
	and eax, 1
	mov [sum], eax
	
	mov eax, 4
	mov ebx, 1
	mov ecx, sum
	mov edx, 1
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, new_line
	mov edx, len_nl
	int 80h
	
	mov eax, [num1]
	mov ebx, [num2]
	mul ebx
	add eax, '0'
	mov [mol], eax
	
	mov eax, 4
	mov ebx, 1
	mov ecx, mol
	mov edx, 1
	int 80h

  mov eax, 4
	mov ebx, 1
	mov ecx, new_line
	mov edx, len_nl
	int 80h

	mov eax, [mol]
	sub eax, 0	
	and eax, 1
	jz even
	jnz odd

	even:
	mov eax, 4
	mov ebx, 1
	mov ecx, even_msg
	mov edx, len_even_msg
	int 80h
	jmp fine
	 

	odd:
	mov eax, 4
	mov ebx, 1
	mov ecx, odd_msg
	mov edx, len_odd_msg
	int 80h
	jmp fine

	fine:
	mov eax, 1
	mov ebx, 0
	int 80h
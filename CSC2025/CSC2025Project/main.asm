.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near
extern writeLine: near
extern readLine: near
extern atoi: near
extern itoa: near

.data

prompt1		byte	'Enter Number 1: ', 0
prompt2		byte	'Enter Number 2: ', 0
prompt3		byte	'The multiplication result is: ', 0 
readbuff	byte	32 DUP ( 0 )
num1		dword	?
num2		dword	?


.code
main PROC near
_main:

	mov		eax, offset prompt1
	push	eax
	call	writeLine

	push	offset readbuff	
	call	readLine

	push	offset readbuff
	call	atoi
	mov		num1, eax

	mov		eax, offset prompt2
	push	eax
	call	writeLine

	push	offset readbuff
	call	readLine

	push	offset readbuff
	call	atoi
	mov		num2, eax
	
	mov		ebx, offset prompt3
	push	ebx
	call	writeLine

	mov		eax, num1
	mov		ebx, num2

	mul		ebx

	push	eax
	call	itoa

	push	ecx
	call	writeline

	push	0
	call	_ExitProcess@4

main ENDP
END
.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data

.code
main PROC near
_main:

	; sum of numbers
 	mov eax, 1
	mov ebx, 1
	_startloop: 
		add eax, ebx
		cmp eax, 10
		jl _startloop

	push  0
	call  _ExitProcess@4

main ENDP
END
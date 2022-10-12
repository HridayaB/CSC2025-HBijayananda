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
	
	call _myFunc

	push  0
	call  _ExitProcess@4

main ENDP

_myFunc PROC near

	num1 dword 1
	num2 dword 2

	mov eax, num1
	add eax, num2

	;push eax
	
	ret
_myFunc ENDP

END
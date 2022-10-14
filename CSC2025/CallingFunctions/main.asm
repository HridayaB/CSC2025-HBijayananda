.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data
num1  dword  1
num2  dword  2
.code
main PROC near
_main:
	
	push 1
	push 2
	call _myFunc
	call _myFunc

	push  0
	call  _ExitProcess@4

main ENDP

_myFunc PROC near
	
	;num1 dword 1
	;num2 dword 2

	push ebp
	mov ebp, esp
	sub esp, 64

	mov eax, num1
	add eax, num2

	pop ebp
	
	ret 8
_myFunc ENDP

END
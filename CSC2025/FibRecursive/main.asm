.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near
extern fibrecurse: near

.data

n			dword   4; the nth term

.code
main PROC near
_main:

	mov		eax, n
	push	eax
	call	fibrecurse

	push	0
	call	_ExitProcess@4

main ENDP
END
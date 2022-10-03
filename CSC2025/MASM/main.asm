.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsole@4: near
extern _readConsole@4: near

.data

.code
main PROC near
_main:

	push  0
	call  _ExitProcess@4

main ENDP
END
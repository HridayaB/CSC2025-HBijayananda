.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data

ihandle		dword	? ; the input handle
written		dword	?
.code
readLine PROC near
_readLine:
	push	ebp
	mov		ebp, esp

	; rhandle = GetStdHandle ( -10 )
	push	-10
	call	_GetStdHandle@4
	mov		ihandle, eax

	mov		ebx, [ ebp + 8 ]

	; ReadConsole ( rhandle, &msg [ 0 ], ?, &written, 0 )
	push	0
	push	offset written
	push	32
	push	ebx
	push	ihandle
	call	_ReadConsoleA@20

	mov		esp, ebp
	pop		ebp
	ret		4

readLine ENDP
END

.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data

ohandle		dword	? ; the output handle
written		dword	?
result		dword	?

.code
writeLine PROC near
_writeLine:

	push	ebp
	mov		ebp, esp
	sub		esp, 4

	; ohandle = GetStdHandle ( -11 ) ; 
	push	-11
	call	_GetStdHandle@4
	mov		ohandle, eax

	mov		eax, [ ebp + 8 ]
	mov		[ ebp - 4 ], eax

	mov		ebx, -1
	mov		ecx, [ ebp - 4 ]
	_loop:
		add		ebx, 1
		mov		dl, [ ecx ]
		add		ecx, 1
		cmp		dl, 0
	jnz _loop

	; WriteConsole ( ohandle, &prompt [ 0 ], ebx, &written, 0 )
	push	0
	push	offset written
	push	ebx
	push	[ ebp - 4 ]
	push	ohandle 
	call	_WriteConsoleA@20

	mov		esp, ebp
	pop		ebp
	ret		4

writeLine ENDP
END

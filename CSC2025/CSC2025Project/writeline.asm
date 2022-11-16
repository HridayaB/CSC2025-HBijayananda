.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data


.code
writeLine PROC near
_writeLine:
	push ebp
	mov ebp, esp
	sub esp, 4

	mov eax, [ ebp + 8 ]
	add [ ebp - 4 ], eax
	add eax, [ ebp - 4 ]

	mov ebx, -1
	mov edx, offset prompt1
	_loop:
		add		ebx, 1
		mov		al, [edx]
		add		edx, 1
		cmp		al, 0
	jnz _loop


	; WriteConsole ( ohandle, &msg [ 0 ], ebx, &written, 0 )
	push  0
	push  offset written
	push  ebx
	push  offset prompt1
	push  ohandle
	call  _WriteConsoleA@20

	mov		eax, written ;eax has the number of characters written
	mov		esp, ebp
	pop		ebp
	ret 4

writeLine ENDP
END
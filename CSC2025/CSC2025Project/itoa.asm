.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data
arr		byte		12 DUP ( 0 )

.code
itoa PROC near
_itoa:
	push	ebp
	mov		ebp, esp

	mov		ebx, [ ebp + 8 ]
	mov		edi, 10
	mov		ecx, offset arr

	add		ecx, 11
	mov		edx, 0
	mov		eax, ebx 

	_division:
	dec		ecx
	mov		edx, 0
	div		edi
	add		dl, 48

	mov		[ ecx ], dl

	cmp		eax, 0
	jne		_division

	mov		eax, edx

	mov		esp, ebp
	pop		ebp
	ret		4

itoa ENDP
END

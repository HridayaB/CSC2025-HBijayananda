.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data

.code
atoi PROC near
_atoi:
	push	ebp
	mov		ebp, esp

	mov		ebx, [ ebp + 8 ]
	mov		ecx, 0
	mov		eax, 0

	mov		esi, 10

	_aToIStart:
	mov		cl, [ ebx ]
	cmp		cl, 13
	je		_exitAToI

	sub		cl, 48
		
	mul		esi
	add		eax, ecx

	inc		ebx
	jmp		_aToIStart

	_exitAToI:

	mov		esp, ebp
	pop		ebp
	ret		4

atoi ENDP
END

.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data

.code

fibrecurse PROC near
_fibrecurse :

push	ebp
mov		ebp, esp
sub		esp, 4
push	esi

mov		eax, [ ebp + 8 ]

cmp		eax, 2
jg		_exitRecurse1
jl		_exitRecurse2

mov		eax, 1
mov		esp, ebp
pop		ebp
ret

_exitRecurse1:

dec		eax
push	eax
call	fibrecurse

mov		[ ebp - 4 ], eax
dec		dword	ptr [ esp ]
call	fibrecurse

add		esp, 4
add		eax, [ ebp - 4 ]

_exitRecurse2:

mov		esp, ebp
pop		ebp
ret	

fibrecurse ENDP
END
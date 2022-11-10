.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data

previous	dword   1; the previous number
current		dword   1; the current number
sum			dword   0; the sum of the previous and current

.code

fibrecurse PROC near
_fibrecurse :

push	ebp
mov		ebp, esp

cmp		ecx, 2
jle		_exitRecurse

mov		eax, previous
add		eax, current
mov		sum, eax

mov		ebx, current
mov		previous, ebx
mov		current, eax

dec		ecx

push	eax
call	fibrecurse

_exitRecurse:

mov		esp, ebp
pop		ebp
ret		1

fibrecurse ENDP
END
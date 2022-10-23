.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data

i			dword   0; accumilator
previous	dword   1; the previous number
current		dword   0; the current number
next		dword   0; the sum of previousand current

.code

fibrecurse PROC near
_fibrecurse :

push	ebp
mov		ebp, esp
sub		esp, 4

mov		eax, previous
add		eax, current
mov		next, eax

mov		ebx, current
mov		previous, ebx
mov		current, eax
add		i, 1
cmp		ecx, i
je		_exitrecurse
push	ecx
call	fibrecurse

_exitrecurse :

mov		esp, ebp
pop		ebp
ret 

fibrecurse ENDP
END
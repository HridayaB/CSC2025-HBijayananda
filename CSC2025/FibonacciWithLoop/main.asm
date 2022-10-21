.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data

	n   dword   10 ; the nth term
	previous   dword   1 ; the previous number
	current   dword   0 ; the current number
	next   dword   0 ; the sum of previous and current
	

.code
main PROC near
_main:
		
		; Fibonacci
		
		mov ecx, n

		_loop:
			
			mov		eax, previous
			add		eax, current
			mov		next, eax

			mov		ebx, current
			mov		previous, ebx
			mov		current, eax

			loopne _loop
			
	push  0
	call  _ExitProcess@4

main ENDP
END
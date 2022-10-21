.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data

	n   dword   5 ; the nth term
	i   dword   2 ; accumilator
	previous   dword   0 ; the previous number
	current   dword   1 ; the current number
	next   dword   0 ; the sum of previous and current
	

.code
main PROC near
_main:
		
		; Fibonacci
		mov ecx, n
		_loop:
			
			mov eax, previous
			add eax, current
			mov next, eax

			mov ebx, current
			mov previous, ebx
			mov current, eax
			add i, 1
			cmp ecx, i
			jge _loop


	push  0
	call  _ExitProcess@4

main ENDP
END
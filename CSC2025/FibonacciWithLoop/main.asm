.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data

	n   dword   10 ; the nth term
	i   dword   3 ; accumilator
	previous   dword   1 ; the previous number
	current   dword   1 ; the current number
	next   dword   0 ; the sum of previous and current
	

.code
main PROC near
_main:
		
		; Fibonacci
		_loop:
			mov ecx, n
			mov eax, previous
			add eax, current
			mov next, eax

			mov ebx, current
			mov previous, ebx
			mov current, eax
			add i, 1
			cmp ecx, i
			jl _endloop ; jmp condition used to exit loop and not for the loop itself
			loop _loop
			
		_exitLoop:
	push  0
	call  _ExitProcess@4

main ENDP
END
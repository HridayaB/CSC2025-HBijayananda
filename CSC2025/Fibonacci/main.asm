.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data

	n   dword   ?
	previous   dword   1
	current   dword   1
	next   dword   0

.code
main PROC near
_main:
		; Fibonacci
		_loop:
			mov ebx, n
			mov eax, previous
			add eax, current
			mov next, eax

			mov ebx, current
			mov previous, ebx
			mov current, eax
			cmp eax, 13
			jl _loop


	push  0
	call  _ExitProcess@4

main ENDP
END
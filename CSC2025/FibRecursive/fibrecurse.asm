	.386P
	.model flat

	extern _ExitProcess@4:near
	extern _GetStdHandle@4: near
	extern _WriteConsoleA@20:near
	extern _ReadConsoleA@20:near

	.data

	i   dword   2 ; accumilator
	previous   dword   0 ; the previous number
	current   dword   1 ; the current number
	next   dword   0 ; the sum of previous and current

	.code
	fibrecurse PROC near
	_fibrecurse:

		push ebp
		mov ebp, esp
		sub esp, 4
		push eax

		mov eax, [ ebp + 8 ]
		add [ ebp - 4 ], eax
		add eax, [ ebp - 4 ]

		mov ecx, n
		mov eax, previous
		add eax, current
		mov next, eax

		mov ebx, current
		mov previous, ebx
		mov current, eax
		add i, 1
		cmp ecx, i

		push ecx
		call fibrecurse
	
		pop eax
		mov esp, ebp
		pop ebp
		ret 

	fibrecurse ENDP
	END
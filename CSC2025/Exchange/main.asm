.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data
	
	num1   dword   10
	num2   dword   20
	num3   dword   30
	num4   dword   40

.code
main PROC near
_main:

	mov eax, num1
	mov ebx, num2
	mov ecx, num3
	mov edx, num4
	
	mov num1, edx
	mov num2, ecx
	mov num3, ebx
	mov num4, eax

	push  0
	call  _ExitProcess@4

main ENDP
END
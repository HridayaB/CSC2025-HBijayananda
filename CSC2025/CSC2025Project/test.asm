.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near
extern writeLine: near
extern readLine: near
extern atoi: near
extern itoa: near

.data

prompt1		byte	'Enter Number 1: ', 10
prompt2		byte	'Enter Number 2: ', 10
ohandle		dword	? ; the output handle
written		dword	?

.code
main PROC near
_main:
	
	; ohandle = GetStdHandle ( -11 ) ; 
	push -11
	call _GetStdHandle@4
	mov ohandle, eax

	push offset prompt1
	call writeLine

	push  0
	call  _ExitProcess@4

main ENDP
END
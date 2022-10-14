.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data

ohandle dword ?
rhandle dword ?
written dword ?
msg1 byte 'Input: ', 10
msg2 byte 'Output: ', 10
charArray byte 0, 32

.code
main PROC near
_main:

	; ohandle = GetStdHandle ( -11 )
	push -11
	call _GetStdHandle@4
	mov ohandle, eax

	; rhandle = GetStdHandle ( -10 )
	push -10
	call _GetStdHandle@4
	mov rhandle, eax

	; WrittenConsole ( ohandle, &msg [ 0 ], 8, &written, 0 )
	push 0
	push offset written
	push 8
	push offset msg1
	push ohandle
	call _WriteConsoleA@20

	; ReadConsole ( rhandle, &msg [ 0 ], ?, &written, 0 )
	push 0
	push offset written
	push 100
	push offset msg1
	push rhandle
	call _ReadConsoleA@20

	; WrittenConsole ( ohandle, &msg [ 0 ], 9, &written, 0 )
	push 0
	push offset written
	push 9
	push offset msg2
	push ohandle
	call _WriteConsoleA@20

	; WrittenConsole ( ohandle, &msg [ 0 ], ?, &written, 0 )
	push 0
	push offset written
	push 100
	push offset msg1
	push ohandle
	call _WriteConsoleA@20

	push  0
	call  _ExitProcess@4

main ENDP
END
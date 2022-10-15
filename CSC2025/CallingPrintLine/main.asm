.386P
.model flat

extern _ExitProcess@4: near
extern _ExitProcess@4:near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20:near
extern _ReadConsoleA@20:near

.data

ohandle dword ? ; the output handle
written dword ?
msg byte 'I am working', 0 ; the message that will get printed

.code
main PROC near
_main:

	; ohandle = GetStdHandle ( -11 )
	push -11
	call _GetStdHandle@4
	mov ohandle, eax

	push offset msg
	call PrintLine

	push  0
	call  _ExitProcess@4

main ENDP

PrintLine PROC near
_PrintLine:
	push ebp
	mov ebp, esp
	sub esp, 4
	push eax

	mov eax, [ ebp + 8 ]
	add [ ebp - 4 ], eax
	add eax, [ ebp - 4 ]


	; WriteConsole ( ohandle, &msg [ 0 ], 13, &written, 0 )
	push  0
	push  offset written
	push  13
	push  offset msg
	push  ohandle
	call  _WriteConsoleA@20

	pop eax
	mov esp, ebp
	pop ebp
	ret 4

PrintLine ENDP
END
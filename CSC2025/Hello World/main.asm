.386P
.model flat

extern _ExitProcess@4:near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20:near
extern _ReadConsoleA@20:near

.data

msg        byte        'Hello World!', 10
msg1       byte        'New World!', 10
handle     dword       ?
written    dword       ?

.code
main PROC near
_main:

	; handle = GetStdHandle(-11)
	push   -11
	call   _GetStdHandle@4
	mov    handle, eax

	; WrittenConsole(handle, &msg[0], 13, &written, 0)
	push  0
	push  offset written
	push  13
	push  offset msg
	push  handle
	call  _WriteConsoleA@20

	; WrittenConsole(handle, &msg[0], 11, &written, 0)
	push  0
	push  offset written
	push  11
	push  offset msg1
	push  handle
	call  _WriteConsoleA@20

	push  0
	call  _ExitProcess@4

main ENDP
END
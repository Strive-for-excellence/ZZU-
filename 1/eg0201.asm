; eg0201.asm in Windows Console
	include io32.inc
	.data
msg    byte 'Hello, Assembly!',13,10,0	;字符串
	.code
start:
	mov eax,offset msg		;显示
	call dispmsg

	exit 0
	end start

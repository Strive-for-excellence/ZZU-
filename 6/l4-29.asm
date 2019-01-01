	include io32.inc
	
	.data
	
	ar byte 'abcdefg',13,10,0
	
	.code
	
start:

	mov eax, offset ar
	mov ecx, lengthof ar
	push ecx;
	call dispmem
	pop ecx;
	mov eax,ecx;
	call dispcrlf
	call dispuid
	exit 0
dispmem  proc
	push ebx
	mov  ebx,eax
	
again:
	mov al,[ebx]
	call disphb
	inc ebx
	loop again
	pop ebx
	ret 
dispmem	endp
	
	
	
	
	end start 

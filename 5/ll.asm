; 当CF为1的时候表示已经到了表示的最大值
;	4294930221
	include io32.inc
	
	.data
	
	array dword 1,2,3
	sum   dword ?
	msg1 byte '最大的n:',0
	msg2 byte '最大的和: ',0
	msg3 byte '32能表示的最大值: ',0
	.code
start:

	mov ecx,0FFFFFFFFh
	xor eax,eax;
	mov ebx,1
	
again:
	add eax,ebx
	jc done
	mov sum,eax
	inc ebx
	loop again
done:
	sub ebx,1
	mov eax,ebx
	mov eax,offset msg1
	
	call dispmsg
	mov eax,ebx
	call dispuid
	call dispcrlf
	mov eax,offset msg2
	call dispmsg
	mov eax,sum
	call dispuid
	call dispcrlf
	mov eax,offset msg3
	call dispmsg
	mov eax,0FFFFFFFFh
	call dispuid
	exit 0
	
	end start

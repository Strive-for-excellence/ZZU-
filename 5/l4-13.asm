	include io32.inc
	.data
	buffer 	byte "'1 2 3 '",0
	msg1 	byte ' has	',0
	msg2 	byte ' spaces',0
	
	.code
	
start:
			mov eax,offset buffer
			call dispmsg
		    mov eax,offset msg1
		    call dispmsg
		    
			mov ecx,lengthof buffer
			xor ebx,ebx
			xor edx,edx
Num: 		cmp buffer[ebx],' '
			jnz next
			
			add edx,1
next:
			inc ebx
			dec ecx
			jnz Num
			
			mov eax,edx
			call dispuid
			mov eax, offset msg2
			call dispmsg
			
			exit 0
			end start
			

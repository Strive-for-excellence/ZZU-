include io32.inc

			.data
	no_msg 	  	byte 'Not Ready',0
	yes_msg 	byte 'Read to Go!',0
			.code
start:
			mov eax,02h
			shr eax,2
			
			jnc nom
			mov eax,offset yes_msg
			jmp done
nom:		mov eax,offset no_msg
done:	    call dispmsg
			exit 0
	  
	  
	  
			end start

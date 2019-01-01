		include io16.inc
		
		.data
		freq  word 1193180/600
		frequ =  1193180
		fre   dword 524,588,660,698,784,880,988,1048
		ar1 = frequ/588
		timer = 10000
		.code
start:	
		mov ax,@data
		mov ds,ax
		mov ecx,3
labe:
		call readc
		cmp al,1bh
		jz done
	    sub al,'0'
		;call dispuid
		call dispcrlf
		call music
		call dispcrlf
		jmp labe
done: 
		exit 0
music 	proc
		push ebx
		push ecx
		push edx
		mov edx,offset fre
		xor ebx,ebx
		mov bl,al
		mov ecx,[edx+ebx*4]
		
		mov eax,frequ
		div ecx
		mov eax,ecx
		call dispuid
		call dispcrlf
		push eax
		mov eax,ar1
		call dispuid
		call dispcrlf
		pop eax
		call dispuid
		call dispcrlf
		call speaker
		call speakon
		;call readc
		call delay
		call speakoff
	   pop edx
	   pop ecx
	   pop ebx
       ret 
music  endp
speaker 	proc

		push ax
		mov al,0b6h
		out 43h,al
		pop ax
		out 42h,al
		mov al,ah
		out 42h,al
		ret
speaker	endp
		
speakon 	proc
		push ax
		in al,61h
		or al,03h
		out 61h,al
		pop ax
		ret 
speakon endp

speakoff proc
		 push ax
		 in al,61h
		 and al,0fch
		 out 61h,al
		 pop ax
		 ret
speakoff endp
delay   proc
		push bx
		push cx
		mov bx,timer
delay1:	
        xor cx,cx
delay2:	loop delay2
		dec bx
		jnz delay1
		pop cx
		pop bx
		ret 
delay	endp
		end start

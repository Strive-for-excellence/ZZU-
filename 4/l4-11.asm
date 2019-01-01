include io32.inc
		.data
	_in 		byte 'Input Number: 0~9',0
	error byte 'Error!',0
		.code
start:
		
input:	
		mov eax,offset _in
		call dispmsg
		call dispcrlf	
		call readc
		call dispcrlf
		cmp eax,'0'
		jl err 
		cmp eax,'9'
		ja err
		call dispc
		jmp done

err: 	mov eax,offset error
		call dispmsg
		call dispcrlf
		jmp input
done:
		exit 0
   
		end start
	
		;遇到的问题有：
		;以为小写字母比大写字母要小，所以就用了sub，然后发现时用add，发现课本上用的时or
		;想起了20h的二进制时00100000 所以可以用位运算

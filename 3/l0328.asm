include io32.inc

		.data
	bcd byte 92h
		.code
start:

		mov al,bcd
		and al,0Fh
		add al,30h
	    call dispc
	    
		mov al,bcd
		shr al,4
		and al,0Fh
		add al,30h
        call dispc
		
		exit 0
		end start
	

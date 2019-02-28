include irvine32.inc
.data
count byte ?
.code
main PROC

MOV EAX,0
mov EDX,2
push EDX


call Clrscr
		
	Stage0:
			add count,1

			call getInput	;Read a character from the screen.

			.if( AL == 'a')
				MOV EDX,0		;Store 0 into the stack.
				PUSH EDX
				jmp Stage0		;Go back to stage0 again.
				
			.elseif(AL == 'b')
				MOV EDX,1	;Store 1 into the stack.
				PUSH EDX

				jmp Stage1		;If input is b go to Stage 1

			.elseif(AL == 'c')
				MOV EDX,0		;Store 0 into the stack.
				PUSH EDX

			    jmp stage2      ; If input is c go to stage 2

			.else               
				jmp Quit        ;If it is not a valid input get out.
			.endif
	Stage1:
			add count,1
			call getInput	;Read a character from the screen.

			.if( AL == 'a')	
				MOV EDX,0		;Store 0 into the stack.
				PUSH EDX
				jmp Stage0   ;If input is a go to stage0.
				   
			.elseif(AL == 'b' || AL == 'c')
				MOV EDX,0		;Store 0 into the stack.
				PUSH EDX
				jmp Stage2	;If input is b or c go to stage2.

			.else
				jmp Quit

			.endif
	Stage2:
			add count,1
			call getInput	;Read a character from the screen.

			.if( AL == 'a')
				MOV EDX,0		;Store 0 into the stack.
				PUSH EDX
				jmp Stage0
				   
			.elseif(AL == 'b')
				MOV EDX,0	;Store 0 into the stack.
				PUSH EDX
				jmp Stage2

			.elseif(AL == 'c')
				MOV EDX,1	;Store 0 into the stack.
				PUSH EDX
				jmp Stage1

			.else
				jmp Quit

			.endif
			
	Quit:
		call crlf
		POP EDX

		; NOTE: Display output backwards since everything is in a stack.
		.while(EDX != 2)
			MOV EAX,EDX
			call writedec
			POP EDX
		.endw
		call crlf

exit
main ENDP

;Get the input from the user 
getInput PROC
	call readChar
	call writechar
ret
getInput ENDP
end main


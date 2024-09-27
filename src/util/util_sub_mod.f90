submodule (util_mod) util_sub_mod
	implicit none
	
	contains 
	
	module procedure print_text
		write(*,"(A)") text
	end procedure print_text
	
	module procedure print_line_separator
		integer::i=1
		character(len=times)::buffer
		do i=1,times
			buffer(i:i) = ch
		end do
		call print_text(buffer)
		return
	end procedure print_line_separator

	module procedure print_center_text
		integer::padding
		integer::i,j = 1
		character(len=line_width)::buffer
		padding = (line_width - len(text)) / 2
		do i=1,padding
			buffer(i:i) = ' '
		end do
		i=padding
		do
			if ( j > len(text) ) exit
			buffer(i:i) = text(j:j)
			i = i + 1
			j = j + 1
		end do
		do i=padding+len(text),line_width
			buffer(i:i) = ' '
		end do
		call print_text(buffer)
		return
	end procedure print_center_text

end submodule util_sub_mod

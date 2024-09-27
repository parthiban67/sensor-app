module util_mod
	implicit none
	
	interface
		module subroutine print_text(text)
			implicit none
			character(len=*), intent(in)::text
		end subroutine print_text 
		
		module subroutine print_center_text(text,line_width)
			implicit none
			character(len=*), intent(in)::text
			integer, intent(in)::line_width
		end subroutine print_center_text
		
		module subroutine print_line_separator(ch,times)
			implicit none
			character(len=1), intent(in)::ch
			integer, intent(in)::times
		end subroutine print_line_separator
		
	end interface
end module util_mod

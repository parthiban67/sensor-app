program main
	implicit none
	integer::menu_option = -1
	call print_line_separator('*',80)
	call print_center_text("Welcome to Sensor Processor App",80)
	call print_line_separator('*',80)
	do
		call print_text("Main menu")
		call print_text("Sensor Emit [1]")
		call print_text("Sensor Process [2]")
		call print_text("Exit [-1]")
		call print_text("Enter the menu option")
		read(*,*) menu_option
		if (menu_option == -1) then
			call print_text("Exiting from main menu...")
			exit
		end if
	end do
end program main

subroutine print_text(text)
	implicit none
	character(len=*), intent(in)::text
	write(*,"(A)") text
end subroutine print_text

subroutine print_line_separator(ch,times)
	implicit none
	character(len=1), intent(in)::ch
	integer, intent(in)::times
	integer::i=1
	character(len=times)::buffer
	do i=1,times
		buffer(i:i) = ch
	end do
	write(*,"(A)") buffer
	return
end subroutine print_line_separator

subroutine print_center_text(text,line_width)
	implicit none
	character(len=*), intent(in)::text
	integer, intent(in)::line_width
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
	write(*,"(A)") buffer
	return
end subroutine print_center_text

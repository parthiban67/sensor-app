program main

	use util_mod
	use sensor_emit_mod
	
	implicit none
	
	integer::menu_option = -1
	call test()
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




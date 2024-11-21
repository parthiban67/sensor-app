        program main
        
        use util_mod
        use sensor_emit_mod,emit_menu_option => handle_menu_option
        use sensor_process_mod,process_menu_option => handle_menu_option

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
                else if(menu_option == 1) then
                        call emit_menu_option()
                else if(menu_option == 2) then
                        call process_menu_option()
                end if
        end do
        end program main




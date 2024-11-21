        module sensor_process_mod
                
                use util_mod

                implicit none
 
                contains

                subroutine testq

                end subroutine testq

                subroutine handle_menu_option
                        integer::menu_option = -1
                        integer::emit_times = 0
                        do
                                call print_text("Sensor Process Menu")
                                call print_text("Calc Avg [1]")
                                call print_text("Calc Max [2]")
                                call print_text("Calc Min [3]")
                                call print_text("Exit [-1]")
                                call print_text("Enter the menu option")
                                read(*,*) menu_option
                                if (menu_option == -1) then
                                        call print_text("Exiting from& 
                                        & Sensor Process Menu...")
                                        exit
                                elseif (menu_option == 1) then
                                        call testq()
                                elseif (menu_option == 2) then

                                elseif (menu_option == 3) then

                                end if
                        end do
                end subroutine handle_menu_option

        end module sensor_process_mod

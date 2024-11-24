        module sensor_process_mod
                
                use util_mod
                use sensor_persistence_mod

                implicit none
 
                contains

                subroutine calc_avg 
                        type(sensor_data_list)::sd_list
                        integer::total_rows = 0
                        real::total_temp = 0.0
                        real::avg_temp = 0.0
                        character(len=20)::str
                        sd_list = read_rows()
                        call sd_list%for_each(process_avg)
                        call sd_list%clear_list()
                        avg_temp = total_temp / total_rows
                        write(str,'(F10.2)') avg_temp
                        call print_text("Sensor Avg temperature is "&
                        & // str)

                        contains

                        subroutine process_avg(s_data)
                                class(sensor_data),intent(inout)::s_data
                                total_rows = total_rows + 1
                                total_temp = total_temp + &
                                &s_data%temperature
                                return
                        end subroutine process_avg
                end subroutine calc_avg

                subroutine calc_max()
                        implicit none
                        type(sensor_data_list)::sd_list
                        real::max_temp = 0.0
                        character(len=20)::str
                        sd_list = read_rows()
                        call sd_list%for_each(process_max)
                        call sd_list%clear_list()
                        write(str,'(F10.2)') max_temp
                        call print_text("Sensor Max temperature is "&
                        & // str)
                        
                        contains

                        subroutine process_max(s_data)
                                class(sensor_data),intent(inout)::s_data
                                if (max_temp < s_data%temperature) then
                                        max_temp = s_data%temperature
                                end if
                                return
                        end subroutine
                end subroutine
                
                subroutine calc_min()
                        implicit none
                        type(sensor_data_list)::sd_list
                        real::min_temp = 1000.0
                        character(len=20)::str
                        sd_list = read_rows()
                        call sd_list%for_each(process_min)
                        call sd_list%clear_list()
                        write(str,'(F10.2)') min_temp
                        call print_text("Sensor Min temperature is "&
                        & // str)
                        
                        contains

                        subroutine process_min(s_data)
                                class(sensor_data),intent(inout)::s_data
                                if (min_temp > s_data%temperature) then
                                        min_temp = s_data%temperature
                                end if
                                return
                        end subroutine
                end subroutine

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
                                        call calc_avg()
                                elseif (menu_option == 2) then
                                        call calc_max()
                                elseif (menu_option == 3) then
                                        call calc_min()
                                end if
                        end do
                end subroutine handle_menu_option

        end module sensor_process_mod

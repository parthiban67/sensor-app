        submodule (sensor_emit_mod) sensor_emit_submod                
                
                use util_mod
                use sensor_data_mod
                use sensor_persistence_mod

                implicit none

                contains

                module procedure emit
                        type(sensor_data)::sdata
                        sdata = sensor_data(real(times))
                        call writeRow(sdata)
                end procedure emit       
       
                module procedure handle_menu_option
                        integer::menu_option = -1
                        integer::emit_times = 0
                        do
                                call print_text("Sensor Emit Menu")
                                call print_text("Emit Into File[1]")
                                call print_text("Exit [-1]")
                                call print_text("Enter the menu option")
                                read(*,*) menu_option
                                if (menu_option == -1) then
                                        call print_text("Exiting from& 
                                        & Sensor Emit Menu...")
                                        exit
                                elseif (menu_option == 1) then
                                        call print_text("Enter the emi&
                                        &t times: ")
                                        read(*,*) emit_times
                                        call emit(emit_times)
                                end if
                        end do
                end procedure handle_menu_option
    
        end submodule sensor_emit_submod

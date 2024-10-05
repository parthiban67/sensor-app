module sensor_emit_mod

        implicit none
       
        interface
                module subroutine emit(times)
                        implicit none
                        integer,intent(in)::times
                end subroutine emit
                module subroutine handle_menu_option()
                        implicit none
                end subroutine handle_menu_option
        end interface
  
end module sensor_emit_mod

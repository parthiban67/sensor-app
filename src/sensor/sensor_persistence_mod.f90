        module sensor_persistence_mod
                
                use sensor_data_mod
                implicit none
                
                interface
                        module subroutine writeRow(row)
                                implicit none
                                type(sensor_data),intent(in)::row 
                        end subroutine writeRow
                end interface

        end module sensor_persistence_mod

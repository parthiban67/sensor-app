        module sensor_persistence_mod
                
                use sensor_data_mod
                implicit none
                
                interface write_row
                        module subroutine write_single_row(row)
                                implicit none
                                type(sensor_data),intent(in)::row 
                        end subroutine write_single_row

                        module subroutine write_multiple_row(rows)
                                implicit none
                                type(sensor_data),dimension(:)&
                                &,intent(in)::rows
                        end subroutine write_multiple_row
                end interface write_row

                interface
                        module subroutine clear_rows()
                                implicit none
                        end subroutine clear_rows
                end interface

        end module sensor_persistence_mod

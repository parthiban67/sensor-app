        submodule (sensor_persistence_mod) sensor_persistence_submod    

                use sensor_data_mod 

                implicit none

                real::temperature
                namelist /emitlist/ temperature

                contains

                logical function is_file_exists()
                        logical::file_exists
                        inquire(file=get_sensor_data_file(),exist=&
                        &file_exists)
                        if (.not. file_exists) then
                                write(*,"(A)") "sensor data file not&
&found"
                        end if
                        is_file_exists = file_exists
                end function is_file_exists

                module procedure write_single_row
                        integer::io_unit

                        temperature = row%temperature
                        if (is_file_exists()) then
                                open(newunit=io_unit,file=get_sensor_data_file(&
                                &),position='append',status='old',&
                                &action='write')
                                write(io_unit,nml=emitlist)
                                flush(unit=io_unit)
                                close(unit=io_unit)
                        end if
                end procedure write_single_row

                module procedure write_multiple_row
                        integer::io_unit,rows_length,i
                        rows_length = size(rows)
                        if (is_file_exists()) then
                                open(newunit=io_unit,file=get_sensor_data_file(&
                                &),position='append',status='old',&
                                &action='write')
                                do i = 1, rows_length
                                        temperature = rows(i)%temperature
                                        write(io_unit,nml=emitlist)
                                end do
                                flush(unit=io_unit)
                                close(unit=io_unit)
                        end if
                end procedure write_multiple_row

                module procedure clear_rows
                        integer::io_unit
                        if (is_file_exists()) then
                                open(newunit=io_unit,file=get_sensor_data_file()&
                                &,status='replace',action='write')
                                close(unit=io_unit)
                        end if
                end procedure clear_rows

        end submodule sensor_persistence_submod

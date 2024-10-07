        submodule (sensor_persistence_mod) sensor_persistence_submod    

                use sensor_data_mod 

                implicit none

                real::temperature
                namelist /emitlist/ temperature

                contains

                module procedure write_single_row
                        integer::io_unit
                        logical::file_exists

                        temperature = row%temperature

                        inquire(file=get_sensor_data_file(),exist=&
                        &file_exists)
                        if (.not. file_exists) then
                                write(*,"(A)") "sensor data file not&
&found"
                                return
                        end if
                        open(newunit=io_unit,file=get_sensor_data_file(&
                        &),position='append',status='old',&
                        &action='write')
                        write(io_unit,nml=emitlist)
                        flush(unit=io_unit)
                        close(unit=io_unit)
                end procedure write_single_row

                module procedure write_multiple_row
                        integer::io_unit,rows_length,i
                        logical::file_exists
                        
                        rows_length = size(rows)

                        inquire(file=get_sensor_data_file(),exist=&
                        &file_exists)
                        if (.not. file_exists) then
                                write(*,"(A)") "sensor data file not&
&found"
                                return
                        end if
                        open(newunit=io_unit,file=get_sensor_data_file(&
                        &),position='append',status='old',&
                        &action='write')
                        do i = 1, rows_length
                                temperature = rows(i)%temperature
                                write(io_unit,nml=emitlist)
                        end do
                        flush(unit=io_unit)
                        close(unit=io_unit)
                end procedure write_multiple_row

        end submodule sensor_persistence_submod

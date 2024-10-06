        submodule (sensor_persistence_mod) sensor_persistence_submod    

                use sensor_data_mod 

                implicit none

                real::temperature
                namelist /emitlist/ temperature

                contains

                module procedure writeRow
                        integer::io_unit
                        logical::file_exists
                        temperature = row%temperature
                        inquire(file=get_sensor_data_file(),exist=&
                        &file_exists)
                        if (.not. file_exists) then
                                write(*,"(A)") "sensor data file not&
&found"
                        end if
                        open(newunit=io_unit,file=get_sensor_data_file(&
                        &),position='append',status='old',&
                        &action='write')
                        write(io_unit,nml=emitlist)
                        flush(unit=io_unit)
                        close(unit=io_unit)
                end procedure writeRow
        end submodule sensor_persistence_submod

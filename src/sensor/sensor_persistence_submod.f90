        submodule (sensor_persistence_mod) sensor_persistence_submod    

               use sensor_data_mod 

                implicit none

                real::temperature
                namelist /emitlist/ temperature

                contains

                module procedure writeRow
                        integer::io_unit
                        temperature = row%temperature
                        open(newunit=io_unit,file=get_sensor_data_file(&
                        &),status='REPLACE')
                        write(io_unit,nml=emitlist)
                        flush(unit=io_unit)
                        close(unit=io_unit)
                end procedure writeRow
        end submodule sensor_persistence_submod

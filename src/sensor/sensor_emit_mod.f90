module sensor_emit_mod

	use sensor_data_mod
	
	implicit none
	
	contains
	
	subroutine test()
		integer::io_unit
		open(newunit=io_unit,file=get_sensor_data_file(),status='REPLACE')
		write(io_unit,"(A)") "test"
		close(unit=io_unit)
	end subroutine test
	
end module sensor_emit_mod

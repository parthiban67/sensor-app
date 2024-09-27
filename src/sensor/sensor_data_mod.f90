module sensor_data_mod
	implicit none
	
	character(len=*),parameter::sensor_data_file &
	& = "/data/sensor_data.txt"
	
	type :: sensor_data
		real::temperature
	end type sensor_data

	contains 
	
	character(len=255) function get_sensor_data_file() 
		character(len=255)::cwd
		call getcwd(cwd)
		get_sensor_data_file = trim(cwd) // sensor_data_file
	end function get_sensor_data_file
	
end module sensor_data_mod

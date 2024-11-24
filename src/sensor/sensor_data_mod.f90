module sensor_data_mod
        implicit none

        character(len=*),parameter::sensor_data_file &
        & = "/data/sensor_data.txt"

        type :: sensor_data
		real::temperature
        end type sensor_data

        type,extends(sensor_data) :: sensor_data_node
                type(sensor_data_node),pointer::next
        end type sensor_data_node

        type :: sensor_data_list
                integer,private::list_count = 0
                type(sensor_data_node),pointer,private::head => null()
                contains
                procedure,pass::length
                procedure,pass::push
                procedure,pass::pop
                procedure,pass::shift
                procedure,pass::unshift
                procedure,pass::clear_list
                procedure,pass::for_each
                final::finalize
        end type sensor_data_list

        
        contains 
        
        subroutine finalize(this)
                type(sensor_data_list),intent(inout)::this
                ! Working, but not clear when 
                ! it's getting invoked
        end subroutine finalize

        subroutine clear_list(this)
                implicit none
                class(sensor_data_list),intent(inout)::this
                type(sensor_data_node),pointer::temp
                this%list_count = 0
                do      
                        if(associated(this%head)) then
                                temp => this%head
                                this%head => this%head%next
                                deallocate(temp)
                        else
                                exit
                        end if
                end do
        end subroutine clear_list

        character(len=255) function get_sensor_data_file() 
                character(len=255)::cwd
                call getcwd(cwd)
                get_sensor_data_file = trim(cwd) // sensor_data_file
        end function get_sensor_data_file

        integer function length(this)
                implicit none
                class(sensor_data_list),intent(in)::this
                length = this%list_count
        end function length

        subroutine push(this,temperature)
                implicit none
                real,intent(in)::temperature
                class(sensor_data_list),intent(inout)::this
                type(sensor_data_node),pointer::temp,new_node
                allocate(new_node)
                new_node%temperature = temperature
                new_node%next => null()
                if(.not. associated(this%head)) then
                        this%head => new_node
                else
                        temp => this%head
                        do
                                if (.not. associated(temp%next)) then
                                        exit
                                end if
                                temp => temp%next
                        end do
                        temp%next => new_node
                end if
                this%list_count = this%list_count + 1
        end subroutine push

        function pop(this) result(node)
                implicit none
              
                class(sensor_data_list),intent(inout)::this
                type(sensor_data_node),pointer::temp,prev
                !class used instead of type to extract pointer
                !for sensor_data from sensor_data_node
                class(sensor_data),pointer::node

                if (this%list_count == 0) then
                        node => null()
                else if (this%list_count == 1) then
                        node => this%head
                        this%head => null()
                        this%list_count = this%list_count - 1
                else
                        temp => this%head
                        prev => null()
                        do
                                if (.not. associated(temp%next)) then
                                        exit
                                end if
                                prev => temp
                                temp => temp%next
                        end do      
                        prev%next => null()  
                        this%list_count = this%list_count - 1
                        node => temp        
                end if
        end function pop

        subroutine unshift(this,temperature)
                implicit none
                real,intent(in)::temperature
                class(sensor_data_list),intent(inout)::this
        end subroutine unshift

        function shift(this) result(node)
                implicit none
                class(sensor_data_list),intent(inout)::this
                class(sensor_data),pointer::node 
        end function shift

        subroutine read_list(sd_list)
                implicit none
                class(sensor_data_list),intent(in)::sd_list
                class(sensor_data_node),pointer::temp => null()

                temp => sd_list%head
                        do
                                if (.not. associated(temp)) then 
                                        exit
                                end if
                                write(*,*) temp%temperature
                                temp => temp%next
                        end do
                return

        end subroutine read_list

        subroutine for_each(this,cb)
                implicit none
                interface
                         module subroutine cb(s_data)
                         implicit none
                         class(sensor_data),intent(inout)::s_data
                        end subroutine cb
                end interface

                class(sensor_data_list),intent(in)::this
                external::cb
                class(sensor_data_node),pointer::temp => null()

                temp => this%head
                do
                        if(.not. associated(temp)) then
                                exit
                        end if
                        call cb(temp)
                        temp => temp%next

                end do
        end subroutine for_each

end module sensor_data_mod

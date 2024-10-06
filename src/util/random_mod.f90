        module random_mod

                ! state maintain var
                logical,private::initialized = .false.
                
                private::initialize
                public::get_random_number

                contains

                subroutine initialize()
                        integer::n,alloc_stat
                        integer,allocatable,dimension(:)::seed
                        if (.not. initialized) then
                                initialized = .true.
                                call random_seed(size=n)
                                allocate(seed(n),stat = alloc_stat)
                                if (alloc_stat /= 0) then
                                        write(*,*) "Error: allocating&
&array for setting the seed for random number"
                                        return
                                end if
                                seed = 123456789
                                call random_seed(put=seed)
                                deallocate(seed)
                        end if
                end subroutine initialize
                
                real function get_random_number()
                        real::rand_number
                        call random_number(rand_number)
                        rand_number = (1-rand_number) * 100
                        get_random_number = rand_number
                end function get_random_number

        end module random_mod

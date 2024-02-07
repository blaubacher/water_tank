module assembly_m
    use water_tank, only: tank_t
    implicit none
    private

    type, public :: assembly_t
        type(tank_t) :: assembly
    end type

end module assembly_m
module state_m
    use water_tank, only: tank_t
    implicit none
    private

    type, public :: state_t
        type(tank_t) :: state
    end type

    end module state_m
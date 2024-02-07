module increment_m
    use water_tank, only: tank_t
    implicit none
    private

    type, public :: increment_t
        implicit none
        real :: increment
    end type

end module increment_m
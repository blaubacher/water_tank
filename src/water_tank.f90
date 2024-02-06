module water_tank
  implicit none
  private
  real, public, parameter :: rho_ref=1000.0, pi=3.14159, g=9.81

  type, public :: tank_t
    real:: diam, orifice_diam, h, sg
  contains  
    procedure :: mass, mdot, vel, p, rho, csa, sw, oa
  end type tank_t

interface

  module function mass(tank)
    class(tank_t), intent(in) :: tank
    real :: mass
  end function

  module function p(tank)
    class(tank_t), intent(in) :: tank
    real :: p
  end function

  module function vel(tank)
    class(tank_t), intent(in) :: tank
    real :: vel
  end function

  module function mdot(tank)
    class(tank_t), intent(in) :: tank
    real :: mdot
  end function

  module function sw(tank)
    class(tank_t), intent(in) :: tank
    real :: sw
  end function

  module function rho(tank)
    class(tank_t), intent(in) :: tank
    real :: rho
  end function

  module function csa(tank)
    class(tank_t), intent(in) :: tank
    real :: csa
  end function

  module function oa(tank)
    class(tank_t), intent(in) :: tank
    real :: oa
  end function

  end interface

end module water_tank

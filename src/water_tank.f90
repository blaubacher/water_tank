module water_tank
  implicit none
  private
  real, parameter :: rho_ref=1000.0, pi=3.14159, g=9.81

  type, public :: tank_t
    real:: diam, orifice_diam, h, sg
  contains  
    procedure :: mass, mdot, vel, p, rho, csa, sw, oa
  end type tank_t

  contains

  module function mass(tank)
    class(tank_t), intent(in) :: tank
    real :: mass
        mass=tank%rho()*tank%csa()*tank%h
  end function

  module function p(tank)
    class(tank_t), intent(in) :: tank
    real :: p
    p=tank%sw()*tank%h
  end function

  module function vel(tank)
    class(tank_t), intent(in) :: tank
    real :: vel
    vel=sqrt(2*tank%p()/tank%rho())
  end function

  module function mdot(tank)
    class(tank_t), intent(in) :: tank
    real :: mdot
    mdot=tank%rho()*tank%vel()*tank%oa()
  end function

  module function sw(tank)
    class(tank_t), intent(in) :: tank
    real :: sw
    sw=tank%rho()*g
  end function

  module function rho(tank)
    class(tank_t), intent(in) :: tank
    real :: rho
    rho=tank%sg*rho_ref
  end function

  module function csa(tank)
    class(tank_t), intent(in) :: tank
    real :: csa
    csa=pi*(tank%diam/2)**2
  end function

  module function oa(tank)
    class(tank_t), intent(in) :: tank
    real :: oa
    oa=pi*(tank%orifice_diam/2)**2
  end function
end module water_tank

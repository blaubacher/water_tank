submodule (water_tank) water_tank_s
implicit none

contains

module procedure mass
      mass=tank%rho()*tank%csa()*tank%h
end procedure

module procedure p
  p=tank%sw()*tank%h
end procedure

module procedure vel
  vel=sqrt(2*tank%p()/tank%rho())
end procedure

module procedure mdot
  mdot=tank%rho()*tank%vel()*tank%oa()
end procedure

module procedure sw
  sw=tank%rho()*g
end procedure

module procedure rho
  rho=tank%sg*rho_ref
end procedure

module procedure csa
  csa=pi*(tank%diam/2)**2
end procedure

module procedure oa
  oa=pi*(tank%orifice_diam/2)**2
end procedure

end submodule
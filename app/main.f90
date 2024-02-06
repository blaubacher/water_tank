program main
implicit none
real, parameter :: g=9.81, pi=3.14159, rho_ref=1000.0
real :: tank_diam=10.0, orifice_diam=1.0, h=40.0, sg=1.0
real :: mass, vol, mdot, v, p, sw, rho, dm, csa
real :: time=0, dt=1.0, output(500000,6)
integer :: i=1, j

csa=pi*(tank_diam/2)**2

! compute the specific weight of the fluid
rho=rho_ref*sg
sw=rho*g
vol=csa*h
mass=vol*rho
p=sw*h
v=sqrt(2*p/rho)

! code is intialized, now proceed to produce the results
do while(h>5.0)
  ! output the required information at start of time step
  output(i,:)=[time, mass, h, p, v, mdot]
! compute pressure
  p=sw*h
  ! compute velocity
  v=sqrt(2*p/rho)
  ! compute the mass flow rate
  associate(a=> pi/4.0*orifice_diam**2)
    mdot=rho*v*a
  end associate
  
  ! compute mass increment
  dm=mdot*dt
  ! update tank conditions
  mass=mass-dm

  h=mass/rho/csa
 

  ! update counters and time
  i=i+1
  time=time+dt
end do

! write output to a file
open(unit=15, file='outputdat', form='formatted', status='unknown')
do j=1,i-1
  write(15,'(7f15.3)') output(j,:)
end do
close(15)
print *, 'all done folks!'

! close program










end program main

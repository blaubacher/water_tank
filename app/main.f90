program main
  use water_tank, only : tank_t
  use state_m, only: state_t
  use assembly_m, only: assembly_t
  use rate_m, only: rate_t

  implicit none
  real :: time=0, dt=1.0, output(500000,6), dm
  type(tank_t) :: mytank
  type(assembly_t) :: the_assembly
  type(state_t) :: the_state
  type(rate_t) :: the_rate
  
  integer :: i=1, j

  mytank=tank_t(diam=10, orifice_diam=1.0, h=40, sg=1.0)
  the_assembly=assembly_t(mytank)
  the_state=state_t(mytank)
  the_rate=rate_t(0.0) ! no dh/dt going on yet


  

  do while(mytank%h>=5.0)
  
    output(i,:)=[time, mytank%mass(), mytank%h, mytank%p(), &
                mytank%vel(), mytank%mdot()]

    ! compute the change in tank height based on 
    ! outflow of a given mass
    dm=mytank%mdot()*dt
    mytank%h=mytank%h-dm/(mytank%rho()*mytank%csa())

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

program main
  use water_tank, only : tank_t
  use rate_m, only: rate_t
  use increment_m, only: increment_t

  implicit none
  real :: time=0, dt=1.0, output(500000,6), dm
  type(tank_t) :: mytank
  type(rate_t) :: dhdt
  type(increment_t) :: dh
  
  integer :: i=1, j

  mytank=tank_t(diam=10, orifice_diam=1.0, h=40, sg=1.0)
  dhdt=rate_t(0.0) ! no dh/dt going on yet
  dh=increment_t(0.0)
    

  do while(mytank%h>=5.0)
  
    output(i,:)=[time, mytank%mass(), mytank%h, mytank%p(), &
    mytank%vel(), mytank%mdot()]

    ! rate is simply dh/dt = f(mdot)                
      
    ! compute the change in tank height based on 
    ! outflow of a given mass
    associate(rho=> mytank%rho(), csa=>mytank%csa())
      dhdt%rate=-mytank%mdot()/rho/csa
    end associate
    
    dh%increment=dhdt%rate*dt
    mytank%h=mytank%h+dh%increment

    i=i+1
    time=time+dt
  end do

  ! write output to a file
  open(unit=15, file='output.dat', form='formatted', status='unknown')
  do j=1,i-1
    write(15,'(7f15.3)') output(j,:)
  end do
  close(15)
  print *, 'all done folks!'

! close program










end program main

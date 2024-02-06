module water_tank
  implicit none
  private

  public :: say_hello
contains
  subroutine say_hello
    print *, "Hello, water_tank!"
  end subroutine say_hello
end module water_tank

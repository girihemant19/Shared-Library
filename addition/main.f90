program main
  implicit none
  integer, parameter :: n = 10000
  real(kind=8), dimension(n) :: a, b, c
  integer :: i

  ! Initialize arrays
  do i = 1, n
    a(i) = i
    b(i) = i * 2
  end do

  ! Call subroutine from shared library
  call add_arrays(a, b, c, n)

  ! Print results with 2 decimal places
  print *, "a + b = c"
  do i = 1, n
    print *, a(i), "+", b(i), "=", c(i)
  end do

end program main


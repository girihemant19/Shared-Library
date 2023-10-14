program main
  implicit none

  integer, parameter :: n = 50 ! matrix size

  real(kind=8), dimension(n,n) :: a, b, c
  integer :: i, j

  ! initialize matrices a and b with random values
  call random_seed()
  call random_number(a)
  call random_number(b)

  ! perform matrix multiplication using libgpu.f90 subroutine
  call matrix_multiply(a,b,c,n)

  ! print the result to the console
  do i = 1, n
    do j = 1, n
      write(*,'(f10.4)',advance='no') c(i,j)
    end do
    write(*,*)
  end do

end program main


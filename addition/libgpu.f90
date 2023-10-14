subroutine add_arrays(a, b, c, n)
  implicit none
  integer, intent(in) :: n
  real(kind=8), dimension(n), intent(in) :: a, b
  real(kind=8), dimension(n), intent(out) :: c
  integer :: i

  print *, "IN GPU"

! Copy data to the GPU
        !$acc data copyin(a, b) copyout(c)
        !$acc parallel loop present(a, b, c)
        do i = 1, n
                c(i) = a(i) + b(i)
        end do
        !$acc end parallel
        !$acc end data

end subroutine add_arrays

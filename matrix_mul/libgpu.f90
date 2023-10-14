subroutine matrix_multiply(a, b, c, n)
  implicit none
  integer, intent(in) :: n
  real(kind=8), dimension(n,n), intent(in) :: a, b
  real(kind=8), dimension(n,n), intent(out) :: c
  integer :: i, j, k

  print *, "IN GPU"
!$acc data copyin(a, b) copyout(c)
  !$acc kernels loop present(a,b,c)
  do i = 1, n
    do j = 1, n
      c(i,j) = 0.0d0
      !$acc loop reduction(+:c(i,j))
      do k = 1, n
        c(i,j) = c(i,j) + a(i,k) * b(k,j)
      end do
    end do
  end do
  !$acc end kernels
!$acc end data

end subroutine matrix_multiply


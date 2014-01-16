! subroutine of matrix summation with fortran90
subroutine arraysumf90(a, b, c, nrow, ncol)
  implicit none
  integer nrow, ncol, i, j
  double precision a(nrow, ncol), b(nrow, ncol), c(nrow, ncol)
  c = a + b
end subroutine arraysumf90

! subroutine of matrix inner product with fortran90
subroutine arraymulf90(a, b, c, nrow, ncol)
  implicit none
  integer nrow, ncol, i, j
  double precision a(nrow, ncol), b(nrow, ncol), c(nrow, ncol)
  c = matmul(a, b)
end subroutine arraymulf90


c     linear_equ.f
c     Example of solving linear equations
c     solving the matrix equation A*x=b using LAPACK
c     From: http://www.physics.orst.edu/~rubin/nacphy/lapack/codes/linear-f.html
      Program LinearEquations
      Implicit none
c     declarations, notice single precision
      Real*4 A(3,3), b(3)
      integer i, j, pivot(3), ok
c     define matrix A
      data A/3.1, 1.0, 3.4, 1.3, -6.9, 7.2, -5.7, 5.8, -8.8/
c     define vector b, make b a matrix and you can solve multiple
c     equations with the same A but different b
      data b/-1.3, -0.1, 1.8/
c     find the solution using the LAPACK routine SGESV
      call SGESV(3, 1, A, 3, pivot, b, 3, ok)
c     parameters in the order as they appear in the function call
c     order of matrix A, number of right hand sides (b), matrix A,
c     leading dimension of A, array that records pivoting, 
c     result vector b on entry, x on exit, leading dimension of b
c     return value 
c     
c     print the vector x
      do i=1, 3
         write(*,*) b(i)
      end do
      end

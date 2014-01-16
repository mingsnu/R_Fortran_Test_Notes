c     Example of solving linear equations
c     From: http://www.physics.orst.edu/~rubin/nacphy/lapack/codes/linear-f.html
c     SUBROUTINE: SGESV( N, NRHS, A, LDA, IPIV, B, LDB, INFO )
c     http://www.netlib.org/lapack/single/sgesv.f
c     Solving the matrix equation A*x=b using LAPACK
      Subroutine Lineareq(A, b, n, info)
      Implicit none
      integer n, info
      integer ipiv(n)
      double precision A(n, n), b(n)
      call DGESV(n, 1, A, n, ipiv, b, n, info)
      end

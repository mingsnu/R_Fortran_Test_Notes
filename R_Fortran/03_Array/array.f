c     subroutine of matrix summation with fortran77
      subroutine arraysumf(a, b, c, nrow, ncol)
      implicit none
      integer nrow, ncol, i, j
      double precision a(nrow, ncol), b(nrow, ncol), c(nrow, ncol)
      do 10 i = 1, nrow
         do 20 j = 1, ncol
            c(i, j) = a(i, j) + b(i, j)
 20      continue
 10   continue
      end

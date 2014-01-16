c     IDAMAX searches a double precision vector for the first occurrence
c     of the the maximum absolute value.
c     Arguments:
c       n: Number of elements to process in the vector to be searched.
c       x: Array of dimension (n-1) * |incx| + 1.
c       incx: Increment between elements of x.
      subroutine idamaxf(n, x, incx, y)
      integer n, incx, y, idamax
      double precision x(*)
      y = idamax(n, x, incx)
      return
      end 

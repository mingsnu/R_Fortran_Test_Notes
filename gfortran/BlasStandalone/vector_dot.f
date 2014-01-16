c vector_dot.f
c Example. Using BLAS Level 1 Routine
c vector-vector dot product
c Compute (1, 3, 5, 7, 9) * (10, 9, 8, 7, 6)
      program dot_main
      real x(10), y(10), sdot, res
      integer n, incx, incy, i
      n=5
      incx=2
      incy=1
      do i = 1, 10
         x(i) = i
         y(i) = 11-i
      end do
      res = sdot(n, x, incx, y, incy)
      print*,'SDOT =', res
      end

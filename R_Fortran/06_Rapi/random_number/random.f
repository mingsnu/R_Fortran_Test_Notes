c A subroutine generating normal & uniform random numbers
      subroutine nurnd(x, y)
      real*8 normrnd, unifrnd, x, y

      call rndstart()
      x = normrnd()
      y = unifrnd()
      call rndend()

      return
      end

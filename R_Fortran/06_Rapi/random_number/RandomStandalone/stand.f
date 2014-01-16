c A main function
      program main
      real*8 a, b

      call setseed(123, 456)
      call testit(a, b)

      print *, a, b
      end

c A subroutine
      subroutine testit(x, y)
      real*8 normrnd, unifrnd, x, y

      x = normrnd()
      y = unifrnd()

      return
      end

c     swap two integer number
      subroutine ISWAPF (a, b)
      integer a, b, tmp
      tmp = a
      a = b
      b = tmp
      end

c     swap two double number
      subroutine DSWAPF (a, b)
      double precision a, b, tmp
      tmp = a
      a = b
      b = tmp
      end

c     Subroutine Reverse:
c     reverses the order of the input array
      subroutine Reversef(a, n)
      integer n, i
      double precision a(n)
      do 10 i = 1, INT(n/2)
         call DSWAPF(a(i), a(n - i + 1))
 10   continue
      end
      
      

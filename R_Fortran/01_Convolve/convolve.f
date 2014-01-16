c A subroutine to convole two finite sequences
      subroutine convolvef(a, na, b, nb, ab)
      integer na, nb, nab, i, j
      double precision a(na), b(nb), ab(na+nb-1)
      nab = na + nb - 1
      
      do 10 i = 1, nab
         ab(i) = 0.0
 10   continue
      do 20 i = 1, na
         do 30 j = 1, nb
            ab(i+j-1) = ab(i+j-1) + a(i)*b(j)
 30      continue
 20   continue
      end
            

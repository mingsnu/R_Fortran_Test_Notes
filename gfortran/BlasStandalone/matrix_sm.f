c matrix_sm.f
c Example. Using BLAS Level 3 Routine
c matrix-matrix solve, solve(A)%*%B, where A is mxm, B is mxn
c         [1, 2, 3]      [1, 4]
c    A =  [2, 4, 5], B = [2, 5]
c         [3, 5, 6]      [3, 6]
c Function: 
c    DTRSM (SIDE, UPLO, TRANSA, DIAG, M, N, ALPHA, A, LDA, B, LDB)
      program dot_main
      double precision a(3,3), b(3,2), alpha
      integer i, j, m, n, lda, ldb
      character side, uplo, transa, diag
      side='l'
      uplo='u'
      transa='n'
      diag='n'
      data A/1.0, 2.0, 3.0, 2.0, 4.0, 5.0, 3.0, 5.0, 6.0/
      data B/1.0, 2.0, 3.0, 4.0, 5.0, 6.0/
      alpha=1.0
      m=3
      n=2
      lda=3
      ldb=3
      write(*,*) "A is:"
      do i=1, m
         print*, (A(i,j), j=1,m)
      enddo

      write(*,*) "B is:"
      do i=1, m
         print*, (B(i,j), j=1,n)
      enddo
      call dtrsm(side, uplo, transa, diag, m, n, alpha, a, lda, b, ldb)

      write(*,*) "After calling 'dtrsm', B is:"
      do i=1, m
         print*, (B(i,j), j=1,n)
      enddo
      end

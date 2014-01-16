c    dnorm defined in R: dnorm(x, mean = 0, sd = 1, log = FALSE)
      subroutine dnormf(x, mean, sd, log, re)
      double precision x, mean, sd, re
      integer log
      call dnormwrap(x, mean, sd, log, re)
      return
      end

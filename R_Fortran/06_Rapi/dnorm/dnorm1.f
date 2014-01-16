c    dnorm defined in R: dnorm(x, mean = 0, sd = 1, log = FALSE)
      subroutine dnormf1(x, mean, sd, log, re)
      double precision x, mean, sd, re, dnormwrap
      integer log
      re = dnormwrap(x, mean, sd, log)
      return
      end

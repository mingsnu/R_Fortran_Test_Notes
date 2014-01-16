## ---- CFCall_benchmark ----
## Compare the speed of C and Fortran interfaces with R
dyn.load(file.path("R_Fortran", "01_convolve", paste0("convolve", .Platform$dynlib.ext)))  # Platform independence
dyn.load(file.path("R_C", "01_convolve", paste0("convolveC", .Platform$dynlib.ext)))
dyn.load(file.path("R_C", "01_convolve", paste0("convolveCall", .Platform$dynlib.ext)))

convolveR <- function(x, y){
  nx <- length(x)
  ny <- length(y)
  z <- double(nx + ny -1)
  for(i in 1:nx)
    for (j in 1:ny)
      z[i + j - 1] = z[i + j-1] + x[i]*y[j]
  z
}

convolveF <- function(x, nx, y, ny){
  .Fortran("convolvef", as.double(x), as.integer(nx), as.double(y), as.integer(ny), double(nx + ny - 1))
}

convolveC <- function(x, nx, y, ny){
  .C("convolveC", as.double(x), as.integer(nx), as.double(y), as.integer(ny), double(nx + ny - 1))
}

convolveCall <- function(x, y){
  .Call("convolveCall", x, y)
}

library(rbenchmark)
set.seed(1204)
x = rnorm(1000); y = rnorm(1000)
nx = length(x); ny = length(y)
benchmark(convolveF = convolveF(x, nx, y, ny), 
          convolveC = convolveC(x, nx, y ,ny), convolveCall = convolveCall(x, y),
          replications=1000, columns=c('test', 'replications', 'elapsed', 'relative'))
system.time(convolveR(x, y))
dyn.unload(file.path("R_Fortran", "01_convolve", paste0("convolve", .Platform$dynlib.ext)))  # Platform independence
dyn.unload(file.path("R_C", "01_convolve", paste0("convolveC", .Platform$dynlib.ext)))
dyn.unload(file.path("R_C", "01_convolve", paste0("convolveCall", .Platform$dynlib.ext)))
## ---- Rcpp_benchmark ----
## basic R function
fibR <- function(n) {
  if (n == 0) return(0)
  if (n == 1) return(1)
  return (fibR(n - 1) + fibR(n - 2))
}

library(Rcpp)
library(inline)
## we need a pure C/C++ function here
incltxt <- '
int fibonacci(const int x) {
  if (x == 0) return(0);
  if (x == 1) return(1);
  return (fibonacci(x - 1)) + fibonacci(x - 2);
}'
## Rcpp version of Fibonacci
fibRcpp <- cxxfunction(signature(xs="int"),
                       plugin="Rcpp",
                       incl=incltxt, body='
                       int x = Rcpp::as<int>(xs);
                       return Rcpp::wrap( fibonacci(x) );
                       ')

library(rbenchmark)
N = 20
res <- benchmark(fibR(N), fibRcpp(N),
                 columns=c("test", "replications", "elapsed",
                           "relative", "user.self", "sys.self"),
                 order="relative", replications=100)
res



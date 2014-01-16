## ---- 01_convolve ----
# Load Shared Objects (*.so) / Dynamic-Link Library (*.DLL)
# dyn.load("01_convolve/convolve.so")     # Linux
# dyn.load("01_convolve/convolve.dll")  # Windows
dyn.load(file.path("R_Fortran", "01_Convolve", paste0("convolve", .Platform$dynlib.ext)))  # Platform independence
# Check whether Fortran subroutine `convolvef` is available
is.loaded("convolvef")

x=1:5
y=6:10
# 
.Fortran("convolvef", as.double(x), as.integer(length(x)), as.double(y), as.integer(length(y)),
         double(length(x) + length(y) - 1))
.Fortran("convolvef", as.double(x), as.integer(length(x)), as.double(y), as.integer(length(y)),
         xy = double(length(x) + length(y) - 1))$xy

# R wrapper
conv_f <- function(x, y){
    if(!(is.numeric(x) && is.numeric(y)))
        stop("x and y should be both numeric vector")
    .Fortran("convolvef", as.double(x), as.integer(length(x)), as.double(y), as.integer(length(y)),
                  double(length(x) + length(y) - 1))
}

conv_f(1:5, 6:10)
conv_f(1:5, 6:7)
dyn.unload(file.path("R_Fortran", "01_Convolve", paste0("convolve", .Platform$dynlib.ext)))  # Platform independence

## ---- 02_swap ----
# ?.Fortran
# All Fortran compilers known to be usable to compile R map
# symbol names to lower case.  Symbol names containing underscores are
# not valid Fortran 77 (although they are valid in Fortran
# 9x). Portable code should not use Fortran names containing underscores.
# `gfortran` transforms names of entities specified in the Fortran source file by appending underscores to them.
dyn.load(file.path("R_Fortran", "02_Swap", paste0("swap", .Platform$dynlib.ext)))
is.loaded("iswapf")

x=10
y=20
# a and b are a copy of x and y, x and y doesn't change
# a and b are called by reference
.Fortran("iswapf", a=as.integer(x), b=as.integer(y))
x; y
# The arguments are not meaningful
.Fortran("iswapf", p=as.integer(x), q=as.integer(y))
# With 'DUP = FALSE', your compiled code can alter the local variable
# DEP=FALSE can speed up the program by avoiding pssing hudge matrix
# Oops..., didn't swap! Why?
.Fortran("iswapf", as.integer(x), as.integer(y), DUP=FALSE)
x; y
# Use `dswapf`. Wow!
.Fortran("dswapf", as.double(x), as.double(y), DUP=FALSE)
x; y
# Mhm...
is.double(x)
x=as.integer(10)
y=as.integer(20)
.Fortran("iswapf", x, y, DUP=FALSE)
x; y

# Reverse a vector
# x, y are vectors of lenth n, exchange x[i] and y[i] if x[i] is bigger than y[i], i=1,...,n
# ivswapf subroutine invokes the iswapf subroutine
# Again, what's the problem here?
x=1:10
if(is.loaded("reversef"))
    .Fortran("reversef", as.double(x), as.integer(length(x)), DUP=FALSE)
# So, always be careful about the dat type
is.integer(x)
x=as.double(1:10)
if(is.loaded("reversef"))
    .Fortran("reversef", x, as.integer(length(x)), DUP=FALSE)
x
dyn.unload(file.path("R_Fortran", "02_Swap", paste0("swap", .Platform$dynlib.ext)))

## ---- 03_array_77 ----
# Fortran77
x=y=z=matrix(1:9, 3)
dyn.load(file.path("R_Fortran", "03_Array", paste0("array", .Platform$dynlib.ext)))
# matrix summation
is.loaded("arraysumf")
.Fortran("arraysumf", as.double(x), as.double(y), as.double(z), as.integer(nrow(x)), as.integer(ncol(x)))[[3]]
x+y
dyn.unload(file.path("R_Fortran", "03_Array", paste0("array", .Platform$dynlib.ext)))

## ---- 03_array_90 ----
# Fortran90
x=y=z=matrix(1:9, 3)
dyn.load(file.path("R_Fortran", "03_Array", paste0("array90", .Platform$dynlib.ext)))
# matrix summation
is.loaded("arraysumf90")
.Fortran("arraysumf90", as.double(x), as.double(y), as.double(z), as.integer(nrow(x)), as.integer(ncol(x)))[[3]]
# matrix multiplication
is.loaded("arraymulf90")
.Fortran("arraymulf90", as.double(x), as.double(y), as.double(z), as.integer(nrow(x)), as.integer(ncol(x)))[[3]]
x%*%y
dyn.unload(file.path("R_Fortran", "03_Array", paste0("array90", .Platform$dynlib.ext)))

## ---- 04_Blas ----
dyn.load(file.path("R_Fortran", "04_Blas", paste0("blas_idamax", .Platform$dynlib.ext)))
# Test
is.loaded("idamaxf")
n = 10
# PROBLEM: when incx < 0, return value is always 0!
incx = 1
x = sample((n-1)*abs(incx) + 1)
x
.Fortran("idamaxf", as.integer(n), as.double(x), as.integer(incx), as.integer(1))[[4]]
# R wrapper
idamax <- function(x, n, by=1){
    if(length(x) < ((n-1)*abs(by) +1))
        stop("x is too short!")
    .Fortran("idamaxf", as.integer(n), as.double(x), as.integer(by), as.integer(1))[[4]]
}
(x=sample(10))
# which(x[1:5]==max(x[1:5]))
idamax(x, 5)
# which(x[seq(1,10,2)]==max(x[seq(1,10,2)]))
idamax(x, 5, by=2)
dyn.unload(file.path("R_Fortran", "04_Blas", paste0("blas_idamax", .Platform$dynlib.ext)))

## ---- 05_Lapack ----
# Solving the matrix equation A*x=b using LAPACK
dyn.load(file.path("R_Fortran", "05_Lapack", paste0("linear_equ", .Platform$dynlib.ext)))
is.loaded("lineareq")
A = matrix(c(3.1, 1.3, -5.7, 1.0, -6.9, 5.8, 3.4, 7.2, -8.8), 3, byrow=TRUE)
b = c(-1.3, -0.1, 1.8)
solve(A)%*%b
.Fortran("lineareq", A=as.double(A), b=as.double(b), n=as.integer(nrow(A)), info=as.integer(1))
# R wrapper
lineareq <- function(A, b){
    if(!is.matrix(A))
        stop("A must be a matrix")
    if(nrow(A) != ncol(A))
        stop("A must be a symmetic matrix")
    if(nrow(A) != length(b))
        stop("The row number of matrix 'A' is different with the length of vector 'b'")
    res = .Fortran("lineareq",
        A=as.double(A), b=as.double(b), n=as.integer(nrow(A)), info=as.integer(1))
    if(res$info < 0)
        stop("Arguments error!")
    else if(res$info > 0)
        stop("Singular!")
    else
        res$b
}
lineareq(A, b)
dyn.unload(file.path("R_Fortran", "05_Lapack", paste0("linear_equ", .Platform$dynlib.ext)))

## ---- 06_Rapi ----
# fortran using R's dnorm function
# C wrapper version 1: void type, no return value
dyn.load(file.path("R_Fortran", "06_Rapi", "dnorm", paste0("dnorm", .Platform$dynlib.ext)))
is.loaded("dnormf")
.Fortran("dnormf", as.double(0), as.double(0), as.double(1), as.integer(0), as.double(0))[[5]]
dyn.unload(file.path("R_Fortran", "06_Rapi", "dnorm", paste0("dnorm", .Platform$dynlib.ext)))

# C wrapper version 2: double type, has return value
dyn.load(file.path("R_Fortran", "06_Rapi", "dnorm", paste0("dnorm1", .Platform$dynlib.ext)))
is.loaded("dnormf1")
.Fortran("dnormf1", as.double(0), as.double(0), as.double(1), as.integer(0), as.double(0))[[5]]
dyn.unload(file.path("R_Fortran", "06_Rapi", "dnorm", paste0("dnorm1", .Platform$dynlib.ext)))

## ---- 06_Rapi_random ----
# fortran using R's random number generation
dyn.load(file.path("R_Fortran", "06_Rapi", "random_number", paste0("random", .Platform$dynlib.ext)))
is.loaded("nurnd")
.Fortran("nurnd", as.double(1), as.double(1))
dyn.unload(file.path("R_Fortran", "06_Rapi", "random_number", paste0("random", .Platform$dynlib.ext)))



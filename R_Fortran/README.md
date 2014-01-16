Instruction
===========

## Content
- 01_Convolve: Illustration of R interface `.Fortran`.
  - `convolvef` calculates the convolution of two vectors with Fortran
- 02_Swap: Illustration of passing by reference.
  - `iswapf`/`dswapf` swap two integer/double numbers; `Reversef` reverses the input vector
- 03_Array: Illustration of fortran90 code and array calculation.
  - `arraysumf`: summation of two double precision matrix with fortran77
  - `arraysumf90`: summation of two double precision matrix with fortran90
  - `arraymulf90`: inner product of two double precision matrix with fortran90
- 04_Blas: Illustration of using BLAS library with R
- 05_Lapack: Illustration of using LAPACK library with R
- 06_Rapi: Illustration of using R API in fortran
- Supplement: Some R code for validation of the fortran program results
- test.R: R code interfacing fortran shared objects in 01 to 06

## Directory structure

    .
    ├── 01_Convolve
    │   ├── convolve.f
    │   ├── convolve.so
    │   └── Makefile
    ├── 02_Swap
    │   ├── Makefile
    │   ├── swap.dll
    │   ├── swap.f
    │   ├── swap.o
    │   └── swap.so
    ├── 03_Array
    │   ├── array90.dll
    │   ├── array90.f90
    │   ├── array90.f90~
    │   ├── array90.o
    │   ├── array90.so
    │   ├── array.dll
    │   ├── array.f
    │   ├── array.o
    │   ├── array.so
    │   └── Makefile
    ├── 04_Blas
    │   ├── blas_idamax.dll
    │   ├── blas_idamax.f
    │   ├── blas_idamax.o
    │   ├── blas_idamax.so
    │   ├── blasqr.pdf
    │   ├── Makevars
    │   └── Makevars.win
    ├── 05_Lapack
    │   ├── linear_equ.dll
    │   ├── linear_equ.f
    │   ├── linear_equ.o
    │   ├── linear_equ.so
    │   ├── Makevars
    │   └── Makevars.win
    ├── 06_Rapi
    │   ├── dnorm
    │   │   ├── dnorm1.dll
    │   │   ├── dnorm1.f
    │   │   ├── dnorm1.o
    │   │   ├── dnorm1_wrapper.c
    │   │   ├── dnorm1_wrapper.o
    │   │   ├── dnorm.dll
    │   │   ├── dnorm.f
    │   │   ├── dnorm.o
    │   │   ├── dnorm.so
    │   │   ├── dnorm_wrapper.c
    │   │   ├── dnorm_wrapper.o
    │   │   ├── Makefile
    │   │   ├── Makefile.win
    │   │   └── Makevars
    │   └── random_number
    │       ├── Makefile.in
    │       ├── random.dll
    │       ├── random.f
    │       ├── random.o
    │       ├── random.so
    │       ├── RandomStandalone
    │       │   ├── Makefile
    │       │   ├── stand
    │       │   ├── stand.f
    │       │   └── stand_wrapper.c
    │       ├── random_wrapper.c
    │       └── random_wrapper.o
    ├── README.html
    ├── README.md
    ├── Structure.txt
    └── testFortran.R



## Standalone blas validation with R
# vector_dot.f
seq(1, 9, by = 2) %*% 10:6
# matrix_sm.f
A = matrix(c(1.0, 2.0, 3.0, 2.0, 4.0, 5.0, 3.0, 5.0, 6.0), 3)
B = matrix(c(1.0, 2.0, 3.0, 4.0, 5.0, 6.0), 3)
A[lower.tri(A)] = 0
solve(A) %*% B
## Standalone lapack validation with R
A = matrix(c(3.1, 1.3, -5.7, 1.0, -6.9, 5.8, 3.4, 7.2, -8.8), 3,
    byrow=TRUE)
b= c(-1.3, -0.1, 1.8)
solve(A)%*%b

A = matrix(c(1.0, 0.7, 0.7, 0.7, 0.7, 1., 0.7, 0.7, 0.7, 0.7, 1., 0.7,0.7, 0.7, 0.7, 1.0),4)
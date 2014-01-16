##' A description of this function
##'
##' Details about this function
##' @title Convolution of two vector
##' @param x numeric vector
##' @param y numeric vector
##' @return numeric vector of length (nx+ny-1)
##' @author weicheng
##' @export
convolveR <- function(x, y){
    nx <- length(x)
    ny <- length(y)
    z <- double(nx + ny -1)
    for(i in 1:nx)
        for (j in 1:ny)
            z[i + j - 1] = z[i + j-1] + x[i]*y[j]
    z
}

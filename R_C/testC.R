## ---- 01_convolveC ----
dyn.load(file.path("R_C", "01_convolve", paste0("convolveC", .Platform$dynlib.ext)))
is.loaded("convolveC")
x=1:5
y=6:10
.C("convolveC", as.double(x), as.integer(length(x)), as.double(y), as.integer(length(y)), 
   double(length(x) + length(y) -1))
# R wrapper
conv_C <- function(x, y){
    if(!(is.numeric(x) && is.numeric(y)))
        stop("x and y should be both numeric vector")
    .C("convolveC", as.double(x), as.integer(length(x)), as.double(y), as.integer(length(y)),
	double(length(x) + length(y) - 1))[[5]]
}
conv_C(1:5, 6:10)
conv_C(1:5, 6:7)
dyn.unload(file.path("R_C", "01_convolve", paste0("convolveC", .Platform$dynlib.ext)))

## ---- 01_convolveCall ----
dyn.load(file.path("R_C", "01_convolve", paste0("convolveCall", .Platform$dynlib.ext)))
is.loaded("convolveCall")
x=1:5
y=6:10
.Call("convolveCall", x, y)
dyn.unload(file.path("R_C", "01_convolve", paste0("convolveCall", .Platform$dynlib.ext)))
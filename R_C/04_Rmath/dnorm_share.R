dyn.load("dnorm_share.so")
is.loaded("normden")
.C("normden", as.double(0), as.double(0), as.double(1), as.integer(0), as.double(0))
dyn.unload("dnorm_share.so")

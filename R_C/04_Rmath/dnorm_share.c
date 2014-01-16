#include <R.h>
#include <Rmath.h>

void normden(double *x, double *mean, double *sd, int *log, double *a)
{
    *a = Rf_dnorm4(*x, *mean, *sd, *log);
}

#include <R.h>
#include <Rmath.h>
// DO NOT USE `dnorm` as the wrap function name.
void F77_SUB(dnormwrap)(double *x, double *mean, double *sd, int *log, double *re)
{
  *re = Rf_dnorm4(*x, *mean, *sd, *log);
}

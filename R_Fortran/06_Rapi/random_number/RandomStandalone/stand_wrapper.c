#define MATHLIB_STANDALONE
#include <R_ext/RS.h>
#include <Rmath.h>

void F77_SUB(setseed)(int a, int b){ set_seed(a, b); }
double F77_SUB(normrnd)(void){ return norm_rand(); }
double F77_SUB(unifrnd)(void){ return unif_rand(); }

#include <stdio.h>
#include <Rmath.h>

int main()
{
  double a = Rf_dnorm4(0, 0, 1, 0);
  printf("%f", a);

  return 0;
}

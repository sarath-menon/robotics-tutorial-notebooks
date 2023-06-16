#include "test.h"
#include <math.h>
double quat(double x) {
   double quat_result;
   quat_result = (1.0/2.0)*M_SQRT2*sqrt(cos(x) + 1);
   return quat_result;
}

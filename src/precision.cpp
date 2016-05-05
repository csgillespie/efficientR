/* Not used */
#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
float test1() {
  float a = 1.0 / 81;
  float b = 0;
  for (int i = 0; i < 729; ++ i)
    b = b + a;
  return b;
}

// [[Rcpp::export]]
double test2() {
  double a = 1.0 / 81;
  double b = 0;
  for (int i = 0; i < 729; ++ i)
    b += a;
    return b;
}
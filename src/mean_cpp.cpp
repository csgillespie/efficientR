#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
double mean_cpp(NumericVector x){
  int i;
  int n = x.size();
  double mean = 0;

  for(i=0; i<n; i++){
    mean = mean + x[i]/n;
  }
  return mean;
}

// [[Rcpp::export]]
NumericVector res_cpp(NumericVector x, NumericVector y){
  int i;
  int n = x.size();
  NumericVector residuals(n);
  for(i=0; i<n; i++){
    residuals[i] = pow(x[i] - y[i], 2);
  }
  return residuals;
}

// [[Rcpp::export]]
NumericVector res_sugar(NumericVector x, NumericVector y){
  return pow(x-y, 2);
}

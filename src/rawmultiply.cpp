// [[Rcpp::depends(RcppArmadillo)]]
#include <RcppArmadillo.h>
using namespace Rcpp;

// [[Rcpp::export]]
double rawmultiply(arma::mat& m1, arma::mat& m2)  {
  return trace(m1 * m1.t() * m2 * m2.t());
}



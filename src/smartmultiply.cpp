// [[Rcpp::depends(RcppArmadillo)]]
#include<RcppArmadillo.h>
#include<vector>
using namespace Rcpp;

// [[Rcpp::export]]
arma::mat smartmultiply(arma::mat& m1, arma::mat& m2, arma::mat& assistmat) {
  arma::mat traces = sum((assistmat.t() * m1 * m1.t()) % (assistmat.t() * m2 * m2.t()), 1);
  // std::vector<double> z = arma::conv_to< std::vector<double> >::from(traces);
  // generate a vector of matrix multiplication results
  return traces;
}

#' Report the calculated traces and time for both the raw method and heuristics.
#' @param B Number of vectors that help calculating trace using the heuristic way.
#' @param N Row number for two matrices.
#' @param K Column number for the first matrix.
#' @param L Column number for the second matrix.
#' @return Doesn't return anything. Only prints out the trace value and time spent.
#' @examples
#' tracecalc(3000,24,13)
#' tracecalc(B=600,4000,16,13)
tracecalc <- function(N,K,L,B=500){
  ## generate two matrices that only contains entries of 0, 1,or 2
  xk <- matrix(rbinom(N*K,1,0.3),N,K)+matrix(rbinom(N*K,1,0.3),N,K)
  xl <- matrix(rbinom(N*L,1,0.1),N,L)+matrix(rbinom(N*L,1,0.1),N,L)
  ## time the calculation of traces based on raw matrix multiplication
  ptm <- proc.time()
  realtrace <- sum(diag((xk%*%t(xk)%*%xl%*%t(xl))))/(K*L)
  origintime <- proc.time() - ptm
  print(paste(c("Real trace is",format(realtrace, ndigits=5)), collapse=" "))
  print(paste(c("Time Spent:", format(origintime[[3]], ndigits=5)), collapse=" "))
  # time the calculation of heuristics
  ptm <- proc.time()
  vecz <- matrix(rnorm(B*N),N,B)# generate B vectors, each entry iid
  temp1 <- t(vecz)%*%xk
  temp1 <- temp1%*%t(xk)
  temp2 <- t(xl)%*%vecz
  temp2 <- xl%*%temp2
  tracesum <- sum(temp1*t(temp2))# elementwise multiplication and addition
  simulatedtrace <- tracesum/(B*K*L)
  newtime <- proc.time() - ptm
  print(paste(c("Simulated trace is", format(simulatedtrace, ndigits=5)), collapse=" "))
  print(paste(c("Time Spent:", format(newtime[[3]], ndigits=5)), collapse=" "))
}

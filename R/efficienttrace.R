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
  realtrace <- rawmultiply(xk,xl)/(K*L)
  origintime <- proc.time() - ptm
  print(paste(c("Real trace is",format(realtrace, ndigits=5)), collapse=" "))
  print(paste(c("Time Spent:", format(origintime[[1]], ndigits=5)), collapse=" "))
  # time the calculation of heuristics
  vecz <- matrix(rnorm(B*N),N,B)# generate B vectors, each entry iid
  ptm <- proc.time()
  tracesum <- smartmultiply(xk, xl, vecz)
  newtime <- proc.time() - ptm
  simulatedtrace <- tracesum/(K*L)# a list of traces generated with different vectors
  print(paste(c("Simulated Trace is", format(sum(simulatedtrace)/B, ndigits=5)), collapse=" "))
  # print(paste(c("Standard Error is", format(sd(simulatedtrace), ndigits=5)), collapse=" "))
  print(paste(c("Time Spent:", format(newtime[[1]], ndigits=5)), collapse=" "))
}

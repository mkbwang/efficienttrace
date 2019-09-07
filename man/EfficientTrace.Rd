\name{EfficientTrace}
\alias{EfficientTrace}
\title{A heuristic to calculate traces of a matrix multiplied by two large matrices}
\arguments{
  \item{B}{Number of vectors that help calculating trace using the heuristic way.}
  \item{N}{Row number for two matrices.}
  \item{K}{Column number for the first matrix.}
  \item{L}{Column number for the second matrix.}
}
\value{Doesn't return anything. Only prints out the trace value and time spent.
}

\examples{
tracecalc(3000,24,13)
tracecalc(B=600,4000,16,13)
}

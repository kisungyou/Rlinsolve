% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lsolve_SOR.R
\name{lsolve.sor}
\alias{lsolve.sor}
\title{Successive Over-Relaxation method}
\usage{
lsolve.sor(
  A,
  B,
  xinit = NA,
  reltol = 1e-05,
  maxiter = 1000,
  w = 1,
  adjsym = TRUE,
  verbose = TRUE
)
}
\arguments{
\item{A}{an \eqn{(m\times n)} dense or sparse matrix. See also \code{\link[Matrix]{sparseMatrix}}.}

\item{B}{a vector of length \eqn{m} or an \eqn{(m\times k)} matrix (dense or sparse) for solving \eqn{k} systems simultaneously.}

\item{xinit}{a length-\eqn{n} vector for initial starting point. \code{NA} to start from a random initial point near 0.}

\item{reltol}{tolerance level for stopping iterations.}

\item{maxiter}{maximum number of iterations allowed.}

\item{w}{a weight value in \eqn{(0,2).}; \code{w=1} leads to Gauss-Seidel method.}

\item{adjsym}{a logical; \code{TRUE} to symmetrize the system by transforming the system into normal equation, \code{FALSE} otherwise.}

\item{verbose}{a logical; \code{TRUE} to show progress of computation.}
}
\value{
a named list containing \describe{
\item{x}{solution; a vector of length \eqn{n} or a matrix of size \eqn{(n\times k)}.}
\item{iter}{the number of iterations required.}
\item{errors}{a vector of errors for stopping criterion.}
}
}
\description{
Successive Over-Relaxation(SOR) method is a variant of Gauss-Seidel method for solving a system of linear equations,
with a decomposition \eqn{A = D+L+U} where \eqn{D} is a diagonal matrix and
\eqn{L} and {U} are strictly lower/upper triangular matrix respectively.
For a square matrix \eqn{A}, it is required to be diagonally dominant or symmetric and positive definite like GS method.
For an overdetermined system where \code{nrow(A)>ncol(A)},
it is automatically transformed to the normal equation. Underdetermined system -
\code{nrow(A)<ncol(A)} - is not supported.
}
\examples{
\donttest{
## Overdetermined System
set.seed(100)
A = matrix(rnorm(10*5),nrow=10)
x = rnorm(5)
b = A\%*\%x

out1 = lsolve.sor(A,b)
out2 = lsolve.sor(A,b,w=0.5)
out3 = lsolve.sor(A,b,w=1.5)
matout = cbind(matrix(x),out1$x, out2$x, out3$x);
colnames(matout) = c("true x","SOR 1 = GS", "SOR w=0.5", "SOR w=1.5")
print(matout)
}

}
\references{
\insertRef{demmel_applied_1997}{Rlinsolve}
}

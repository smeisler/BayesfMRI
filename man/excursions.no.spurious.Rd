% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/excursions.R
\name{excursions.no.spurious}
\alias{excursions.no.spurious}
\title{Excursion sets with removal}
\usage{
excursions.no.spurious(
  alpha,
  u,
  mu,
  Q,
  type,
  n.iter = 10000,
  Q.chol,
  F.limit,
  vars,
  rho = NULL,
  method = "EB",
  ind,
  max.size,
  verbose = FALSE,
  max.threads = 0,
  seed,
  area.limit,
  use.continuous = FALSE,
  factor = 0,
  plot.progress = FALSE,
  mesh
)
}
\arguments{
\item{alpha}{Error probability for the excursion set.}

\item{u}{Excursion or contour level.}

\item{mu}{Expectation vector.}

\item{Q}{Precision matrix.}

\item{type}{Type of region:
\itemize{
\item{'>' }{positive excursion region}
\item{'<' }{negative excursion region}
\item{'!=' }{contour avoiding region}
\item{'=' }{contour credibility region}}}

\item{n.iter}{Number or iterations in the MC sampler that is used for approximating probabilities. The default value is 10000.}

\item{Q.chol}{The Cholesky factor of the precision matrix (optional).}

\item{F.limit}{The limit value for the computation of the F function. F is set to NA for all nodes where F<1-F.limit. Default is F.limit = \code{alpha}.}

\item{vars}{Precomputed marginal variances (optional).}

\item{rho}{Marginal excursion probabilities (optional). For contour regions, provide \eqn{P(X>u)}.}

\item{method}{Method for handling the latent Gaussian structure:
\itemize{
\item{'EB' }{Empirical Bayes (default)}
\item{'QC' }{Quantile correction, rho must be provided if QC is used.}}}

\item{ind}{Indices of the nodes that should be analyzed (optional).}

\item{max.size}{Maximum number of nodes to include in the set of interest (optional).}

\item{verbose}{Should occasional updates be printed? Default: \code{FALSE}.}

\item{max.threads}{The maximum number of threads to use in the inla-program
for model estimation. \code{0} (default) will use the maximum number of
threads allowed by the system.}

\item{seed}{Random seed (optional). Default: \code{NULL}.}

\item{area.limit}{Positive number. All connected excursion sets with an area smaller than this
number are removed.}

\item{use.continuous}{Logical parameter indicating whether the areas of the excursion sets
should be calculated using the \code{continuous} function in \code{excursions}. If FALSE, the
function uses the approximation that the area for each node is the integral of the FEM basis function \eqn{\phi_i}.}

\item{factor}{Non-negative number. If larger than zero, each set is expanded by a small amount
that is proportional to this argument.}

\item{plot.progress}{Logical parameter that indicates whether the results should be plotted.}

\item{mesh}{The mesh on which the model is defined.}
}
\value{
If \code{use.continuous = FALSE}, an item of class \code{excurobj}. Otherwise a list with
the same elements as the output of \code{continuous}.
}
\description{
Calculation of excursion sets with the removal of small areas
}
\details{
Function similar to the excursions function, but which also takes a mesh as input
and computes modified excursion sets where all regions with areas smaller than area.limit are
removed in the internal calculations.
}

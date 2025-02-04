% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot.R
\name{plot_BayesGLM_slice}
\alias{plot_BayesGLM_slice}
\title{Plot results from a BayesGLM object for 2D Analyses}
\usage{
plot_BayesGLM_slice(BayesGLM_object, session_name = NULL, zlim = NULL)
}
\arguments{
\item{BayesGLM_object}{An object of class "BayesGLM"}

\item{session_name}{The name of the session to plot the results from (defaults to the first session)}

\item{zlim}{The color limits for plotting the coefficient values. Defaults to the minimum and maximum of the point estimates}
}
\value{
A ggplot2 object
}
\description{
Plot results from a BayesGLM object for 2D Analyses
}

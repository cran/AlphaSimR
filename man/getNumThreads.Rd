% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{getNumThreads}
\alias{getNumThreads}
\title{Number of available threads}
\usage{
getNumThreads()
}
\value{
integer
}
\description{
Gets the number of available threads by calling the OpenMP function
\code{omp_get_max_threads()}
}
\examples{
getNumThreads()

}

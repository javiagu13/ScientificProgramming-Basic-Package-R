% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ScientificProgrammingFunction-Discretization.R
\name{atributeDiscretizeEF}
\alias{atributeDiscretizeEF}
\title{atributeDiscretizeEF}
\usage{
atributeDiscretizeEF(atribute, n_bins)
}
\arguments{
\item{atribute}{is the atribute}

\item{n_bins}{is the number of steps}
}
\value{
a list of two vectors, the first the actual interval each value belongs to, and the second with the set of intervals
}
\description{
given an atribute vector it separates the values with equal frequency by giving a
number of steps.

As an example an vector like the following "bek<-c(2,13,1,18,3,8,4,20,7,5)" and a number "5" for instance will slice it in different ranges.
}

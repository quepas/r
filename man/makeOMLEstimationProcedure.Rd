% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/OMLEstimationProcedure_Class.R
\name{makeOMLEstimationProcedure}
\alias{OMLEstimationProcedure}
\alias{makeOMLEstimationProcedure}
\title{Construct OMLEstimationProcedure.}
\usage{
makeOMLEstimationProcedure(type, data.splits.url = NA_character_,
  data.splits = NULL, parameters = NULL)
}
\arguments{
\item{type}{[\code{character(1)}]\cr
The type of procedure used for performance estimation: either cross-validation, holdout, bootstrap or
sampling.}

\item{data.splits.url}{[\code{character(1)}]\cr
The url from which a file with train-test splits can be downloaded.}

\item{data.splits}{[\code{data.frame}]\cr
The train-test splits. Default is \code{NULL}, which means data splits have not yet been downloaded.}

\item{parameters}{[\code{list}]\cr
Any parameters for the estimation procedure, e.g. the number of repeats and folds in cross-validation.}
}
\description{
Construct OMLEstimationProcedure.
}


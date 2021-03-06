% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{EFFTOX}
\alias{EFFTOX}
\title{Obtains estimated posterior probabilities of the four outcomes of (YE,YT) for each dose.}
\usage{
EFFTOX(YE, YT, Doses, Dose, Hypermeans, Hypervars, B)
}
\arguments{
\item{YE}{Vector containing observed efficacy indicators.}

\item{YT}{Vector containing observed toxicity indicators.}

\item{Doses}{Vector containing Standardized doses of patients in trial.}

\item{Dose}{Vector containing the standardized doses considered.}

\item{Hypermeans}{Vector containing prior hypermeans of length 6 for Eff-Tox parameters.}

\item{Hypervars}{Vector containing prior hypervariances of length 6 for Eff-Tox parameters.}

\item{B}{Number of iterations to perform in the MCMC.}
}
\value{
The posterior probability matrix for the events (YE,YT) in each row corresponding to a dose level.
}
\description{
This function is used in Reoptimize, SimPhase123 and SimPhase3, here we estimate the mixture probabilities over the four outcomes for efficacy and toxicity.
}
\examples{
##Doses, YE,YT
Doses= c(1,1,1,2,2,2,1,1,1,3,3,3,1,1,1,2,2,2)
YE = c(0,0,1,1,1,0,0,0,0,1,1,1,0,0,1,1,1,0)
YT=c(0,0,0,1,1,0,1,0,0,1,1,1,0,0,0,1,0,0)
##Vector of Numerical Doses
Dose = c(1,2,3,3.5,5)
Dose=(Dose-mean(Dose))/sd(Dose)
Doses=Dose[Doses]
##Hypermeans
Hypermeans = c(.022,3.45,0,-4.23,3.1,0)
Hypervars = c(2.6761, 2.6852, .2, 3.1304, 3.1165, 1)
Hypervars=Hypervars^2
##Number of iterations
B=2000
EFFTOX(YE,YT, Doses, Dose, Hypermeans,  Hypervars, B )
}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SimPhase123.R
\name{SimPhase123}
\alias{SimPhase123}
\title{Simulates replications of the phase123 and phase 12-3 trials.}
\usage{
SimPhase123(DoseStart, Dose, PE, PT, Hypermeans, Hypervars, Contour, PiLim,
  ProbLim, NET, NF, Accrue12, Time12, cohort, betaA, ProbC, betaC, Family,
  alpha, Nmax, Accrue, Twait, NLookSwitch, NLook, Sup, Fut, nSims)
}
\arguments{
\item{DoseStart}{Starting dose of the phase 12 trial.}

\item{Dose}{Vector of standardized doses considered in the trial.}

\item{PE}{True efficacy dose-toxicity vector.}

\item{PT}{True toxicity dose-toxicity vector.}

\item{Hypermeans}{Prior Means for the Eff-Tox design of length 6.}

\item{Hypervars}{Prior Variances for the Eff-Tox design of length 6.}

\item{Contour}{Vector containing 4 entries used to make the desireability function. Contour[1] contains a desired toxicity probability given efficacy, Countour[2] contains a desired efficacy probability given toxicity, and (Contour[3],Contour[4]) is an equally desireable pair of efficacy and toxicity probabilities that are non-zero or one.}

\item{PiLim}{Vector of length two with PiLim[1] containing the acceptable lower limit on efficacy probability and PiLim[2] containing the acceptable upper limit on toxicity probability.}

\item{ProbLim}{Vector of length two with ProbLim[1] containing the probability cutoff for acceptable efficacy probability and ProbLim[2] containing the probability cutoff for acceptable toxicity probability.}

\item{NET}{Maximum sample size of the phase 12 trial.}

\item{NF}{Number of patients to assign deterministic doses prior to adaptive randomization.}

\item{Accrue12}{Accrual rate for patients in the phase 12 portion of the trial.}

\item{Time12}{Time window for phase 12.}

\item{cohort}{Size of each patient cohort.}

\item{betaA}{True linear term for the rate or mean parameter (beta_1,exp(beta_E),-exp(beta_T),beta_2,beta_0) for agent A.}

\item{ProbC}{Probability of efficacy and toxicity for the control therapy.}

\item{betaC}{Linear term for efficacy, toxicity and beta_0 for the control groupar term for efficacy, toxicity and beta_0 for the control group.}

\item{Family}{Time to event distribution. Options include: Exponential, Gamma, Weibull, Lognormal.}

\item{alpha}{Shape parameter or standard deviation of a lognormal distribution.}

\item{Nmax}{Maximum number of patients to enroll in phase 3.}

\item{Accrue}{Accrual rate for patients in the phase 3 portion of the trial.}

\item{Twait}{Waiting time in between phase 12 and phase 3.}

\item{NLookSwitch}{Number of patient events to determine if we re-optimize doses for A.}

\item{NLook}{Vector of information criteria for making interim looks.}

\item{Sup}{Vector of superiority boundaries.}

\item{Fut}{Vector of futility boundaries.}

\item{nSims}{Number of simulations to run for the phase 123 and conventional design.}
}
\description{
This function simulates replications of the phase123 and phase 12-3 trials and returns a list containing the doses chosen, decisions made (1=A(x) better, 0= futility, -1=C better)
}
\examples{
 ##We need to specify Phase 12,
###Phase 3 trial paramters,
##the additional phase 123 parameters and simulation parameters
#This is scenario 3 for the exponetial case
##the additional phase 123 parameters and simulation parameters
###########PHASE12 Parameters ##################
DoseStart=1
##True Efficacy and Toxicity Probabilities
PT = c(.05,.08,.1,.15,.2)
PE=c(.2,.25,.35,.4,.55)
##Raw Dose Levels considered
Dose = c(1,2,3,3.5,5)
#Max Sample Size
NET=30
##Number of patients before randomization
NF=15
##Cohort size
cohort=3
##Hypermeans for Eff-Tox
Hypermeans = c(.022,3.45,0,-4.23,3.1,0)
Hypervars = c(2.6761, 2.6852, .2, 3.1304, 3.1165, 1)
Hypervars=Hypervars^2
##Contour Vector
Contour = c(.35, .75,.7,.4)
##Acceptability Criteria
PiLim = c(.3,.4)
ProbLim=c(.1,.1)
##Phase 12 accrual rate
Accrue12=5
###How long is the time window in phase 12?
Time12=1
##########PHASE3 Parameters####################
Nmax=500
##Number of patient events for interim looks
NLook = c(200,300,400)
##Superiority Boundaries
Sup = c(2.96, 2.53,1.99)
##Futility Boundaries (0 means no futility decision)
Fut = c(0,1.001,0)
##Average accrual rate for phase III
Accrue = 10
###########Phase123 Parameters###########
###Number of patient events to re-optimize doses
NLookSwitch=50
##Time in between phase 12 and phase 3
Twait=1
#########Simulation Parameters######
###Family of Distributions
Family="Gamma"
###Shape parameter, Not needed for Exponential
alpha=1
###True Beta vector (beta_1,exp(beta_E),-exp(beta_T),beta_2,beta_0)
betaA = c(.1, .3, -1,-1,3.6)
##True beta vector for (exp(beta_E),-exp(beta_T),beta_C)  of the control treatment
betaC=c(.3,-1,log(24/1.035111))
##True efficacy and toxicity probability for control group
ProbC = c(.3,.1)
##Number of simulations to run
nSims=1
##Run Simulations
Results=SimPhase123(DoseStart,Dose,PE,PT,Hypermeans,Hypervars,Contour,
                 PiLim,ProbLim,NET,NF,Accrue12,Time12,cohort,betaA,ProbC,betaC,
                Family,alpha,Nmax,Accrue,Twait,NLookSwitch,NLook,Sup,Fut,nSims)
}
\references{
[1] Chapple and Thall (2018).A Hybrid Phase I-II/III Clinical Trial Design Allowing Dose Re-Optimization in Phase III. Biometrics. In Press,
}

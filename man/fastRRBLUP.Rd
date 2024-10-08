% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GS.R
\name{fastRRBLUP}
\alias{fastRRBLUP}
\title{Fast RR-BLUP}
\usage{
fastRRBLUP(
  pop,
  traits = 1,
  use = "pheno",
  snpChip = 1,
  useQtl = FALSE,
  maxIter = 1000,
  Vu = NULL,
  Ve = NULL,
  simParam = NULL,
  ...
)
}
\arguments{
\item{pop}{a \code{\link{Pop-class}} to serve as the training population}

\item{traits}{an integer indicating the trait to model, a trait name,
or a function of the traits returning a single value. Only univariate models
are supported.}

\item{use}{train model using phenotypes "pheno", genetic values "gv",
estimated breeding values "ebv", breeding values "bv", or randomly "rand"}

\item{snpChip}{an integer indicating which SNP chip genotype
to use}

\item{useQtl}{should QTL genotypes be used instead of a SNP chip.
If TRUE, snpChip specifies which trait's QTL to use, and thus these
QTL may not match the QTL underlying the phenotype supplied in traits.}

\item{maxIter}{maximum number of iterations.}

\item{Vu}{marker effect variance. If value is NULL, a
reasonable value is chosen automatically.}

\item{Ve}{error variance. If value is NULL, a
reasonable value is chosen automatically.}

\item{simParam}{an object of \code{\link{SimParam}}}

\item{...}{additional arguments if using a function for
traits}
}
\description{
Solves an RR-BLUP model for genomic predictions given known variance
components. This implementation is meant as a fast and low memory
alternative to \code{\link{RRBLUP}} or \code{\link{RRBLUP2}}. Unlike
the those functions, the fastRRBLUP does not fit fixed effects (other
than the intercept) or account for unequal replication.
}
\examples{
#Create founder haplotypes
founderPop = quickHaplo(nInd=10, nChr=1, segSites=20)

#Set simulation parameters
SP = SimParam$new(founderPop)
\dontshow{SP$nThreads = 1L}
SP$addTraitA(10)
SP$setVarE(h2=0.5)
SP$addSnpChip(10)

#Create population
pop = newPop(founderPop, simParam=SP)

#Run GS model and set EBV
ans = fastRRBLUP(pop, simParam=SP)
pop = setEBV(pop, ans, simParam=SP)

#Evaluate accuracy
cor(gv(pop), ebv(pop))

}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{gause_1934_science_f01}
\alias{gause_1934_science_f01}
\title{Didinium/Paramecium predator/prey experiment}
\format{
A data frame with 17 rows and 3 variables:
\describe{
  \item{Paper}{Paper from which data are drawn}
  \item{Figure}{Figure number in paper}
  \item{Day}{Day of experiment}
  \item{Prey}{Name of Prey Species}
  \item{Individuals_Prey}{Number of Prey Individuals}
  \item{Predator}{Name of Predator Species}
  \item{Individuals_Predator}{Number of Predator Individuals}
  \item{Immigration}{Is immigration occurring in this time-step? (yes or no)}
}
}
\source{
Gause (1934) Experimental Analysis of Vito Volterra's Mathematical Theory of the Struggle for Existence. Science 79:16-17.
}
\usage{
gause_1934_science_f01
}
\description{
A dataset containing the abundances of Paramecium caudatum
and Didinium nasutum grown in mixture. Note, is for the same experiment
as gause_1934_book_f32, except that data were digitized separately,
and therefore have small variations. These might be useful for
estimating observation error in the data digitization process.
}
\keyword{datasets}

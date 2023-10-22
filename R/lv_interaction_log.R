#' Lotka-Volterra Interactions in Log Space
#'
#' Calculates dn/dt for n species in a Lokta-Volterra system, in log space,
#' following the form:
#' dlog(ni)/dt = (ri + aii * ni + sum_j(aij * nj))
#' This form can be helpful for optimization routines where species abundances
#' are close to zero.
#' @param time The time steps corresponding to each observation - exists to interface with ode function, but should be left blank.
#' @param n_log A vector of species abundances, in log space
#' @param parms A vector of parameters - the first n elements should be the growth rates r1, r2, ... rn for all n species.
#' The remaining terms should be the elements of the interaction matrix A, listed in the order a11, a12, ... a1n, a21, a22, ... a2n, ... an1, an2, ... ann.
#' @concept Lokta-Volterra
#' @concept Gause
#' @concept interaction
#' @return vector of growth rates for each species in log space
#' @export

lv_interaction_log <- function(time, n_log, parms) {
  n<-exp(n_log)
  nsp<-length(n)
  
  r<-parms[1:nsp]
  A<-matrix(parms[-(1:nsp)], nrow=nsp, ncol=nsp)
  
  dndt_log <- (r+n%*%A)
  
  list(c(dndt_log))
}

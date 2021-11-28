#' Optimizer for Lotka-Volterra Interactions
#'
#' Identifies optimal parameter values for a Lotka-Volterra interaction system.
#' 
#' @param pars A vector of parameter values in log space to be optimized.
#' Must include a logged starting abundance for each species, followed by the logged absolute values of the growth rates,
#' followed by the logged absolute value of the elements of the interaction matrix.
#' @param opt_data Abundance data for optimization. Must include one column labeled 'time' with time steps, and a column for each species abundance.
#' @param parm_signs A vector that provides the desired sign of each parameter (i.e. -1 or 1).
#' If value is zero, then the term is held at zero (but should be left out of the pars vector).
#' @param standardize A logical, defaulting to TRUE - should error be calculated based on standardized values of
#' outputs? Allows for more equal weighting of observed variabels.
#' @param odefun The function to use to simulate the ODE - defaults to lv_interaction_log
#' @concept Lokta-Volterra
#' @concept Gause
#' @concept interaction
#' @concept optimization
#' @return squared error between model fits for given parameter values, and observations
#' @export
#' @examples 
#' 
#' # load data from competition experiment
#' data(gause_1934_book_f32)
#' 
#' # keep all data - no separate treatments exist for this experiment
#' predatorpreydata<-gause_1934_book_f32
#' 
#' # get time-lagged observations for each species
#' prey_lagged<-get_lag(x = predatorpreydata$Individuals_Prey, time = predatorpreydata$Day)
#' predator_lagged<-get_lag(x = predatorpreydata$Individuals_Predator, time = predatorpreydata$Day)
#' 
#' # calculate per-capita growth rates
#' prey_dNNdt<-percap_growth(x = prey_lagged$x, laggedx = prey_lagged$laggedx, dt = prey_lagged$dt)
#' predator_dNNdt<-percap_growth(x = predator_lagged$x,
#'       laggedx = predator_lagged$laggedx, dt = predator_lagged$dt)
#' 
#' # fit linear models to dNNdt, based on average
#' # abundances between current and lagged time steps
#' prey_mod_dat<-data.frame(prey_dNNdt=prey_dNNdt, prey=prey_lagged$laggedx,
#'       predator=predator_lagged$laggedx)
#' mod_prey<-lm(prey_dNNdt~prey+predator, data=prey_mod_dat)
#' 
#' predator_mod_dat<-data.frame(predator_dNNdt=predator_dNNdt,
#'       predator=predator_lagged$laggedx, prey=prey_lagged$laggedx)
#' mod_predator<-lm(predator_dNNdt~predator+prey, data=predator_mod_dat)
#' 
#' # model summaries
#' summary(mod_prey)
#' summary(mod_predator)
#' 
#' # extract parameters
#' # growth rates
#' r1 <- unname(coef(mod_prey)["(Intercept)"])
#' r2 <- unname(coef(mod_predator)["(Intercept)"])
#' 
#' # self-limitation
#' a11 <- unname(coef(mod_prey)["prey"])
#' a22 <- unname(coef(mod_predator)["predator"])
#' 
#' # effect of Pa on Pc
#' a12 <- unname(coef(mod_prey)["predator"])
#' # effect of Pc on Pa
#' a21 <- unname(coef(mod_predator)["prey"])
#' 
#' # run ODE:
#' # make parameter vector:
#' parms <- c(r1, r2, a11, a12, a21, a22)
#' initialN <- c(4, 0.1)
#' out <- deSolve::ode(y=initialN, times=seq(1, 17, length=100), func=lv_interaction, parms=parms)
#' matplot(out[,1], out[,-1], type="l",
#'         xlab="time", ylab="N", col=c("black","red"), lty=c(1,3), lwd=2, ylim=c(0, 60))
#' legend("topright", c("Pc", "Dn"), col=c(1,2), lwd=2, lty=c(1,3))
#' 
#' # now, plot in points from data
#' points(predatorpreydata$Day, predatorpreydata$Individuals_Predator , col=2)
#' points(predatorpreydata$Day, predatorpreydata$Individuals_Prey, col=1)
#' 
#' # uh-oh - This is a bad fit. This suggests that our linear model
#' # approximation isn't very good. Instead, we should try optimizing
#' # directly using the ode solver
#' 
#' # Re-run using an optimizer
#' # Data for the optimizer:
#' # Must have a column with time steps labeled 'time', and
#' # columns for each species in the community.
#' opt_data<-data.frame(time=predatorpreydata$Day, Prey=predatorpreydata$Individuals_Prey,
#'     Predator=predatorpreydata$Individuals_Predator)
#' 
#' # Save the signs of the parameters -
#' # optimizer works in log space, so these
#' # must be specified separately
#' parm_signs<-sign(parms)
#' 
#' # parameter vector for optimizer -
#' # must be a vector with, first, the
#' # starting abundances in log space,
#' # and second, the parameter values,
#' # again in log space
#' pars<-c(log(initialN), log(abs(parms)))
#' 
#' # run optimizer
#' optout<-optim(par = pars, fn = lv_optim, hessian = TRUE,
#'              opt_data=opt_data, parm_signs=parm_signs)
#' 
#' # extract parameter vector:
#' parms <- exp(optout$par[-c(1:2)])*parm_signs
#' initialN <- exp(optout$par[1:2])
#' 
#' out <- deSolve::ode(y=initialN, times=seq(1, 17, length=100), func=lv_interaction, parms=parms)
#' matplot(out[,1], out[,-1], type="l",
#'         xlab="time", ylab="N", col=c("black","red"), lty=c(1,3), lwd=2, ylim=c(0, 60))
#' legend("topright", c("Pc", "Dn"), col=c(1,2), lwd=2, lty=c(1,3))
#' 
#' # now, plot in points from data
#' points(predatorpreydata$Day, predatorpreydata$Individuals_Predator , col=2)
#' points(predatorpreydata$Day, predatorpreydata$Individuals_Prey, col=1)
#' 
#' # get rough estimate of confidence intervals
#' fisher_info<-solve(-optout$hessian)
#' optout$par_sd<-sqrt(abs(diag(fisher_info)))
#' 
#' parm_signs_sp<-c(rep(1, ncol(opt_data)-1), parm_signs)
#' parameter_intervals<-data.frame(lower_sd=exp(optout$par-optout$par_sd)*parm_signs_sp,
#'                                 mu=exp(optout$par)*parm_signs_sp,
#'                                 upper_sd=exp(optout$par+optout$par_sd)*parm_signs_sp)
#' 
#' rownames(parameter_intervals)<-c("prey", "predator", "r1", "r2", "a11", "a12", "a21", "a22")
#' parameter_intervals

lv_optim<-function(pars, opt_data, parm_signs, standardize=TRUE, odefun=lv_interaction_log) {
  nsp<-ncol(opt_data)-1
  
  logn0<-pars[1:nsp]
  logparms<-pars[-c(1:nsp)]
  
  n0<-exp(logn0)
  times<-opt_data$time
  
  par_opt_use<-numeric(length(parm_signs))
  par_opt_use[parm_signs!=0]<-exp(logparms)*parm_signs[parm_signs!=0]
  
  out <- deSolve::ode(y=log(n0), times=times, func=odefun, parms=par_opt_use)
  
  predictions<-exp(out[,-1,drop=FALSE])
  observations<-opt_data[,-1,drop=FALSE]
  
  if(standardize) {
    for(i in 1:ncol(observations)) {
      mo<-mean(observations[,i], na.rm=T)
      predictions[,i]<-predictions[,i]/mo
      observations[,i]<-observations[,i]/mo
    }
  }
  
  return(sum((predictions-observations)^2, na.rm=T))
}

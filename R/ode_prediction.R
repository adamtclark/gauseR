#' Optimizer extension
#'
#' Takes in paramter values in the form returned by the gause_wrapper function,
#' and calculates expected abundances for all n species, returned as a single vector.
#' This function is potentially useful in combination with other optimizer software,
#' e.g. as might be used for hypothesis testing.
#' @param pars_full Initial Population Size
#' @param time A vector of times. Must be repeated once per species.
#' @param N Number of species. Can be either a number, or a vector the same length as time.
#' @concept competition
#' @concept Gause
#' @concept optimization
#' @return a stacked vector with predicted abundances for all species
#' @export
#' @examples
#' #load competition data
#' data("gause_1934_science_f02_03")
#' 
#' #subset out data from species grown in mixture
#' mixturedat<-gause_1934_science_f02_03[gause_1934_science_f02_03$Treatment=="Mixture",]
#' 
#' #extract time and species data
#' time<-mixturedat$Day
#' species<-data.frame(mixturedat$Volume_Species1, mixturedat$Volume_Species2)
#' colnames(species)<-c("P_caudatum", "P_aurelia")
#' 
#' \donttest{
#' #run wrapper
#' gause_out<-gause_wrapper(time=time, species=species)
#' 
#' # number of species
#' N<-ncol(gause_out$rawdata)-1
#' # parameters
#' pars_full<-c(gause_out$parameter_intervals$mu)
#' # data.frame for optimization
#' fittigdata<-data.frame(y=unlist(gause_out$rawdata[,-1]),
#'                        time=gause_out$rawdata$time,
#'                        N=N)
#' 
#' yest<-ode_prediction(pars_full, time=fittigdata$time, N=fittigdata$N)
#' plot(fittigdata$y, yest, xlab="observation", ylab="prediction")
#' abline(a=0, b=1, lty=2)
#' 
#' #example of how to apply function, using nls()
#' mod<-nls(y~ode_prediction(pars_full, time, N),
#'            start = list(pars_full=pars_full),
#'            data=fittigdata)
#' summary(mod)
#' }

ode_prediction<-function(pars_full, time, N) {
  Nuse<-unique(N)
  timeuse<-time[1:(length(time)/Nuse)]
  logNinit<-log(pars_full[1:Nuse])
  starting_pars<-pars_full[-c(1:Nuse)]
  
  ode_out<-deSolve::ode(y=logNinit, times=timeuse, func=lv_interaction_log, parms=starting_pars, method="ode45")
  ode_out<-c(unlist(exp(ode_out[,-1])))
  
  return(ode_out)
}

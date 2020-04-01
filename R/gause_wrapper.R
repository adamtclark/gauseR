#' Automated wrapper for Gause fitting functions
#'
#' Automatically runs routine for finding starting values and
#' optimal parameter values for a Lotka-Volterra interaction system.
#' Using the default functions, species dynamics follow the form
#' dni/dt = ni * (ri + aii * ni + sum_j(aij * nj))
#' where ri are the elements of vector r, and aij are the elements of matrix A.
#' 
#' @param time Vector of time steps corresponding to observations in species data.frame.
#' @param species A data.frame with one column per species to be fitted.
#' Note - column names cannot include white spaces or non-standard special characters.
#' @param N_starting Optional starting values for initial abundances.
#' @param r_starting Optional starting values for species growth rates. If a value is set to zero, it
#' #forces that parameter to zero in the fitting. Values of NA are ignored. Defaults to NULL (no starting values).
#' @param A_starting Optional starting values for species interaction coefficients. If a value is set to zero, it
#' #forces that parameter to zero in the fitting. Values of NA are ignored. Defaults to NULL (no starting values).
#' @param doplot Logical. Should the resulting model be plotted? Defaults to TRUE.
#' @param keeptimes Should predictions be given for the points in the "time" vector, or for a list of 100 evenly spaced time points? Defaults to FALSE.
#' @param ... Optional additional arguments to be passed to ode and optim functions.
#' @keywords Lokta-Volterra, Gause, interaction, optimization
#' @return A list with simulated time series (out), paramter estimates (parameter_intervals),
#' optimizer output (optout), and raw data used for fitting (rawdata).
#' @export
#' @examples 
#' 
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
#' #run wrapper
#' gause_out<-gause_wrapper(time=time, species=species)

gause_wrapper<-function(time, species, N_starting=NULL, r_starting=NULL, A_starting=NULL, doplot=TRUE, keeptimes=FALSE, ...) {
  #number of species
  if(is.null(dim(species))) {
    if(is.null(names(species))) {
      nm<-"N1"
    } else {
      nm<-names(species)[1]
    }
    species<-data.frame(species)
    colnames(species)<-nm
  }
  Nsp<-ncol(species)
  
  #check if starting values were given
  if(is.null(r_starting) || is.null(A_starting) ||
     sum(is.na(r_starting))!=0 || sum(is.na(A_starting))!=0) {
    #if starting values weren't given, calculate them from linear model
        
    #get growth rates
    laglst<-NULL
    dNNdtlst<-NULL
    for(i in 1:Nsp) {
      #time-lagged abundance
      laglst[[i]]<-get_lag(species[,i], time)
      #per-capita growth
      dNNdtlst[[i]]<-percap_growth(laglst[[i]]$x, laglst[[i]]$laggedx, laglst[[i]]$dt)
    }
    
    #get data_frame with all lagged variables
    lagged_abund<-sapply(laglst, function(dat) dat$laggedx)
    colnames(lagged_abund)<-colnames(species)
    
    #fit model
    modlst<-NULL
    for(i in 1:Nsp) {
      moddat<-data.frame(dNNdt = dNNdtlst[[i]], lagged_abund)
      modlst[[i]]<-eval(parse(text=paste("lm(dNNdt~", paste(colnames(lagged_abund), collapse="+"), ", data=moddat)", sep="")))
    }
    
    #get coefficients
    r_start<-unname(sapply(modlst, function(dat) {stats::coef(dat)["(Intercept)"]}))
    A_start<-unname(sapply(modlst, function(dat) {stats::coef(dat)[-1]}))
    
    if(!is.null(r_starting)) {
      r_start[!is.na(r_starting) & r_starting==0]<-0
    }
    if(!is.null(A_starting)) {
      A_start[!is.na(A_starting) & A_starting==0]<-0
    }
    
  } else {
    r_start<-r_starting
    A_start<-A_starting
  }
  
  #run optimizer
  parms<-c(r_start, A_start)
  if(is.null(N_starting)) {
    initialN<-species[which.min(time),]
    
    #replace zero starting values
    #with small value
    for(i in 1:Nsp) {
      if(is.na(initialN[i]) || initialN[i]==0) {
        initialN[i]<-mean(species[,i][species[,i]!=0],na.rm=T)*0.01
      }
    }
  } else {
    initialN<-N_starting
  }
  
  opt_data<-data.frame(time=time, species)
  parm_signs<-sign(parms)
  pars<-c(log(initialN), log(abs(parms[parms!=0])))
  optout<-stats::optim(par = pars, fn = lv_optim, hessian = TRUE,
                opt_data=opt_data, parm_signs=parm_signs, ...)
  
  #extract fitted parameters
  parms<-numeric(length(parm_signs))
  parms[parm_signs!=0] <- exp(optout$par[-c(1:length(initialN))])*parm_signs[parm_signs!=0]
  initialN <- exp(optout$par[1:Nsp])
  if(keeptimes) {
    timessim<-time
  } else {
    timessim<-seq(min(time), max(time), length=100)
  }
  
  out <- deSolve::ode(y=initialN, times=timessim, func=lv_interaction, parms=parms, ...)

  #plot
  if(doplot) {
    graphics::matplot(out[,1], out[,-1], type="l",
            col=1:Nsp, lty=1:Nsp,
            xlab="time", ylab="N", lwd=2,
            ylim=range(c(out[,-1], species), na.rm=T))
    graphics::matpoints(time, species, col=1:Nsp, pch=1:Nsp)
    graphics::legend("topleft", colnames(species), col=1:Nsp,
           lwd=2, lty=1:Nsp, pch=1:Nsp, bty="n")
  }
  
  #get rough parameter CI's
  fisher_info<-unname(solve(-optout$hessian))
  optout$par_sd<-sqrt(abs(diag(fisher_info)))
  parm_signs_sp<-c(rep(1, ncol(opt_data)-1), parm_signs)
  parameter_intervals<-data.frame(lower_sd=numeric(length(parm_signs_sp)),
                                  mu=numeric(length(parm_signs_sp)),
                                  upper_sd=numeric(length(parm_signs_sp)))
  parameter_intervals[parm_signs_sp!=0,]<-data.frame(lower_sd=exp(optout$par-optout$par_sd)*parm_signs_sp[parm_signs_sp!=0],
                                                     mu=exp(optout$par)*parm_signs_sp[parm_signs_sp!=0],
                                                     upper_sd=exp(optout$par+optout$par_sd)*parm_signs_sp[parm_signs_sp!=0])
  
  #get right signs for intervals
  tmp1<-parameter_intervals$lower_sd
  tmp2<-parameter_intervals$upper_sd
  ps<-which(parameter_intervals$lower_sd>parameter_intervals$upper_sd)
  parameter_intervals$lower_sd[ps]<-tmp2[ps]
  parameter_intervals$upper_sd[ps]<-tmp1[ps]
  
  
  row.names(parameter_intervals)<-c(paste(colnames(species), "0", sep=""),
                                      paste("r", 1:Nsp, sep=""),
                                      paste("a", rep(1:Nsp, each=Nsp), rep(1:Nsp, Nsp), sep=""))
  
  return(list(out=out, parameter_intervals=parameter_intervals, optout=optout, rawdata=data.frame(time, species)))
}



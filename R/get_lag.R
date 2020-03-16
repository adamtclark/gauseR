#' Get timelag
#'
#' Calculates time-lagged observations for variable x, separated by treatment.
#' @param x The time series from which time lagged observations are desired (e.g. population sizes)
#' @param time The time steps corresponding to each observation
#' @param tau Number of time steps to use between lagged components - defaults to 1
#' @param mindt Minimum dt allowed between observations - defaults to 0
#' @param maxdt Maximum dt allowed between observations - defaults to Inf
#' @param treatment An optional vector of treatment conditions - time lags will only be computed separately within treatments - defaults to NULL (i.e. no treatments)
#' @keywords competition, Gause, time lag
#' @return Returns a data.frame with 7 columns: x (unlagged time series data); laggedx (lagged time series data); xmid (average of time series and lagged time series values);
#' dt (time lag between x and laggedx); time (time for observation x); laggedtime (time for observation laggedx); treatment (treatment for observation)
#' @export
#' @examples
#' data(gause_1934_science_f02_03)
#' lagged_data <- get_lag(x=gause_1934_science_f02_03$Volume_Species1,
#'                time = gause_1934_science_f02_03$Day,
#'                treatment = gause_1934_science_f02_03$Treatment)

get_lag<-function(x, time, tau = 1, treatment = NULL, mindt = 0, maxdt = Inf) {
  # separate data by treatment
  if(!is.null(treatment)) {
    treatment_list<-sort(unique(treatment))
  } else {
    treatment_list<-1
    treatment<-rep(1, length(x))
  }
  
  # data.frame for returing results
  dataout<-data.frame(x = NA, laggedx = NA, xmid = NA, dt = NA, time = NA, laggedtime = NA, treatment = rep(NA, length(x)))
  dataout$treatment<-treatment
  dataout$x<-x
  
  # run each treatment category separately
  for(i in 1:length(treatment_list)) {
    # identify observtions within treatment i
    trt_ps<-which(treatment==treatment_list[i])
    time_list<-sort(unique(time[trt_ps]))
    
    # for each observation, find corresponding lagged observation
    for(j in 1:length(trt_ps)) {
      # position of lagged observation
      time_ps<-which(time_list==time[trt_ps[j]])
      if(time_ps>=(tau+1)) {
        # size of time lag
        dt<-time_list[time_ps]-time_list[time_ps-tau]
        if(dt >= mindt & dt <= maxdt) {
          # positions of observations in x
          lagged_position_in_x<-which(time[trt_ps] == time_list[time_ps-tau])
          position_in_x<-which(time[trt_ps] == time_list[time_ps])
          
          # save results
          dataout$dt[trt_ps][position_in_x]<-dt
          dataout$laggedx[trt_ps][position_in_x]<-mean(x[trt_ps][lagged_position_in_x], na.rm=T)
          dataout$time[trt_ps][position_in_x]<-time_list[time_ps]
          dataout$laggedtime[trt_ps][position_in_x]<-time_list[time_ps-tau]
        }
      }
    }
  }
  dataout$xmid<-(dataout$x+dataout$laggedx)/2
  
  return(dataout)
}



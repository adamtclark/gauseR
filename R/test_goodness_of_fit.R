#' Test goodness of fit
#'
#' Tests goodness of fit for predictions vs. observations.
#' This statistic can be though of in the same way as a classic "R2",
#' except that it measures scatter around the 1-1 line, rather than
#' around a fitted regresson line of observed vs. predicted values.
#' Value close to 1 indicate a that predictions match observations closely.
#' Values at or below zero indicate that predictions do not match observations
#' any better than the grand mean taken across all observations.
#' 
#' @param observed A vector or matrix of observed values.
#' @param predicted A vector or matrix of predicted values.
#' @param bycolumn If TRUE, then separate values are calculated for each column in observed and predicted.
#' @param droptimecol If TRUE, will automatically remove the column labeled "time"
#' in the predicted variable. This is useful for dealing with the default output of the gause_wrapper function.
#' Defaults to FALSE.
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
#' #run wrapper
#' #note - keeptimes=TRUE is needed, so that predicted time steps match
#' #observed time steps
#' gause_out<-gause_wrapper(time=time, species=species, keeptimes = TRUE)
#' 
#' #calculate goodness of fit
#' test_goodness_of_fit(observed=species, predicted=gause_out)
#' 
#' # > 0.9 for both time series - these are good fits!

test_goodness_of_fit<-function(observed, predicted, bycolumn = FALSE, droptimecol = TRUE) {
  if(!is.null(dim(predicted)) & droptimecol) {
    predicted<-data.frame(predicted)
    predicted$time<-NULL #drop time column
  }
  
  observed<-as.matrix(observed)
  predicted<-as.matrix(predicted)
  
  if(length(observed)!=length(predicted)) {
    return("error: observed and predicted must be the same length")
  }
  
  if(!bycolumn || is.null(dim(observed))) {
    result<-(1-mean((observed-predicted)^2, na.rm=T)/
      mean((observed-mean(observed, na.rm=T))^2, na.rm=T))
  } else {
    result<-numeric(ncol(observed))
    for(i in 1:ncol(observed)) {
      result[i]<-1-mean((observed[,i]-predicted[,i])^2, na.rm=T)/
        mean((observed[,i]-mean(observed[,i], na.rm=T))^2, na.rm=T)
    }
  }
  return(result)
}


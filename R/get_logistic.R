#' Logistic Growth
#'
#' Calculates logistic growth for population based on formula Nt=K*(N0*exp(r*time))/(K+N0*(exp(r*time)-1)
#' @param N0 Initial Population Size
#' @param time The time steps corresponding to each observation
#' @param r Growth rate
#' @param K Carying Capacity 
#' @keywords competition, Gause, logistic growth
#' @return population size N for each time steps as a vector
#' @export
#' @examples
#' # load Gause competition data
#' data(gause_1934_science_f02_03)
#' # extract monoculture data for P.c.
#' Pcmono<-gause_1934_science_f02_03[gause_1934_science_f02_03$Treatment=="Pc",]
#' 
#' # calculate lag and per-capita growth
#' lagged_data_Pc <- get_lag(x=Pcmono$Volume_Species1,
#'                           time = Pcmono$Day)
#' Pcmono$dNNdt_Pc <- percap_growth(x=lagged_data_Pc$x, laggedx=lagged_data_Pc$laggedx,
#'                                  dt=lagged_data_Pc$dt)
#' 
#' # fit linear model to get dNNdt ~ r + s*N
#' mod_Pc<-lm(dNNdt_Pc~Volume_Species1, Pcmono)
#' rsn_pars<-coef(mod_Pc)
#' 
#' # transform into logistic growth parameters
#' logistic_pars<-c(r=unname(rsn_pars["(Intercept)"]),
#'      K=unname(-rsn_pars["(Intercept)"]/rsn_pars["Volume_Species1"]))
#' 
#' #fit with nls, using linear model estimates as starting values for parameters
#' nls_mod<-nls(Volume_Species1~get_logistic(time = Day, N0, r, K),
#'              data=Pcmono,
#'              start=c(N0=unname(Pcmono$Volume_Species1[which.min(Pcmono$Day)]),
#'              r=unname(logistic_pars["r"]), K=unname(logistic_pars["K"])))
#' summary(nls_mod)
#' 
#' # plot results
#' plot(Volume_Species1~Day, Pcmono, type="b", ylab="P. caudatum Volume")
#' timesq<-seq(0, 30, length=100)
#' Ntest<-get_logistic(time = timesq, N0=coef(nls_mod)["N0"], r=coef(nls_mod)["r"],
#'        K=coef(nls_mod)["K"])
#' 
#' lines(timesq, Ntest, col="red")

get_logistic <- function(time, N0, r, K) {
  return(K*(N0*exp(r*time))/(K+N0*(exp(r*time)-1)))
}



#' Per-capita growth rate
#' 
#' Calculates per-capita growth rate, using log ratios
#' following the formula dN/Ndt = log(N(t)/N0)/dt.
#' @param x Abundance
#' @param laggedx Lagged abundance
#' @param dt Time lag between observations
#' @concept competition
#' @concept Gause
#' @concept growth
#' @return Per-capita growth rate
#' @export
#' @examples
#' data(gause_1934_science_f02_03)
#' lagged_data <- get_lag(x=gause_1934_science_f02_03$Volume_Species1,
#'                time = gause_1934_science_f02_03$Day,
#'                treatment = gause_1934_science_f02_03$Treatment)
#' dNNdt <- percap_growth(x=lagged_data$x, laggedx=lagged_data$laggedx,
#'                dt=lagged_data$dt)

percap_growth<-function(x, laggedx, dt) {
  xrat <- unname(x/laggedx)
  xrat[xrat<=0 | !is.finite(xrat)] <- NA
  return(log(xrat)*1/(dt))
}

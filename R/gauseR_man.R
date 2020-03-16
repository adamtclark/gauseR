#' gauseR: Simple methods for fitting Lotka-Volterra models describing Gause’s “Struggle for Existence”
#'
#' @section Authors:
#' Adam Clark, Lina Mühlbauer, and Maximilienne Schulze.
#'
#' @section Applications:
#' A collection of tools and data for analyzing the Gause microcosm experiments, and for fitting
#' Lotka-Volterra models to time series data. Includes methods for fitting single-species logistic
#' growth, and multi-species interaction models, e.g. of competition, predator/prey relationships,
#' or mutualism. See documentation for individual functions for examples. In general, see the
#' lv_optim function for examples of how to fit parameter values in multi-species systems.
#' 
#' Note that the general methods applied here, as well as the form of the differential equations that
#' we use, are described in detail in the Quantitative Ecology textbook by Lehman et al., cited below.
#' Using the default functions, species dynamics therefore follow the form:
#' 
#' dni/dt = ni * (ri + aii * ni + sum_j(aij * nj))
#' 
#' @docType package
#' @source Clarence Lehman, Shelby Loberg, and Adam T. Clark. (2019). Quantitative Ecology: A New Unified Approach. University of Minnesota Libraries Publishing. University of Minnesota Digital Conservancy, http://hdl.handle.net/11299/204551.
#' @name gauseR
#' @examples
#' #primary wrapper function
#' ?gause_wrapper       # automatically runs functions to get starting values and fit
#'                      # paramter vales using simulated ODE dynamics.
#' 
#' #individual functions
#' ?get_lag             # generate time-lagged variables for estimating per-capita growth
#' ?percap_growth       # generate estimates of per-capita growth rates for species
#' ?get_logistic        # logistic growth function
#' ?lv_interaction      # function for simulating Lotka-Voterra ODE models
#' ?lv_interaction_log  # a version of the lv_interaction computed in log abundance space,
#'                      # which typically works better for optimization
#' ?lv_optim            # methods for fitting complex n-species models
#' ?ode_prediction      # generic function for simulating time series, to be used with other optimizers
NULL
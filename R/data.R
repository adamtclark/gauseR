#' Paramecium competition experiment
#'
#' A dataset containing the abundances of two Paramecium species
#' grown in monoculture and mixture. Note, is for the same experiment
#' as gause_book_1934_f22, except that data were digitized separately,
#' and therefore have small variations. These might be useful for
#' estimating observation error in the data digitization process.
#' "Volume" refers to a standardized index, meant to make the abundances
#' of species comparable based on their relative sizes.
#'
#' @format A data frame with 63 rows and 4 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Day}{Day of experiment}
#'   \item{Species1}{Name of Species 1}
#'   \item{Volume_Species1}{Volume of Paramecium caudatum}
#'   \item{Species2}{Name of Species 2}
#'   \item{Volume_Species2}{Volume of Paramecium aurelia}
#'   \item{Treatment}{Treatments: Pa and Pc moncultures, or mixture}
#' }
#' @source Gause (1934) Experimental Analysis of Vito Volterra's Mathematical Theory of the Struggle for Existence. Science 79:16-17.
"gause_1934_science_f02_03"

#' Paramecium competition experiment
#'
#' A dataset containing the abundances of two Paramecium species
#' grown in monoculture and mixture. Note, is for the same experiment
#' as gause_1934_science_f02_03, except that data were digitized separately,
#' and therefore have small variations. These might be useful for
#' estimating observation error in the data digitization process.
#' "Volume" refers to a standardized index, meant to make the abundances
#' of species comparable based on their relative sizes.
#'
#' @format A data frame with 72 rows and 4 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Day}{Day of experiment}
#'   \item{Species1}{Name of Species 1}
#'   \item{Volume_Species1}{Volume of Paramecium caudatum}
#'   \item{Species2}{Name of Species 2}
#'   \item{Volume_Species2}{Volume of Paramecium aurelia}
#'   \item{Treatment}{Treatments: Pa and Pc moncultures, or mixture}
#' }
#' @source Gause (1934) The Struggle for Existence. Dover Publications; Reprint edition.
"gause_1934_book_f22"

#' Didinium/Paramecium predator/prey experiment
#'
#' A dataset containing the abundances of Paramecium caudatum
#' and Didinium nasutum grown in mixture. Note, is for the same experiment
#' as gause_1934_book_f32, except that data were digitized separately,
#' and therefore have small variations. These might be useful for
#' estimating observation error in the data digitization process.
#'
#' @format A data frame with 17 rows and 3 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Day}{Day of experiment}
#'   \item{Prey}{Name of Prey Species}
#'   \item{Individuals_Prey}{Number of Prey Individuals}
#'   \item{Predator}{Name of Predator Species}
#'   \item{Individuals_Predator}{Number of Predator Individuals}
#'   \item{Immigration}{Is immigration occurring in this time-step? (yes or no)}
#' }
#' @source Gause (1934) Experimental Analysis of Vito Volterra's Mathematical Theory of the Struggle for Existence. Science 79:16-17.
"gause_1934_science_f01"

#' Didinium/Paramecium predator/prey experiment
#'
#' A dataset containing the abundances of Paramecium caudatum
#' and Didinium nasutum grown in mixture. Note, is for the same experiment
#' as gause_1934_science_f01, except that data were digitized separately,
#' and therefore have small variations. These might be useful for
#' estimating observation error in the data digitization process.
#' 
#' @format A data frame with 17 rows and 8 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Day}{Day of experiment}
#'   \item{Prey}{Name of Prey Species}
#'   \item{Individuals_Prey}{Number of Prey Individuals}
#'   \item{Predator}{Name of Predator Species}
#'   \item{Individuals_Predator}{Number of Predator Individuals}
#'   \item{Immigration}{Is immigration occurring in this time-step? (yes or no)}
#' }
#' @source Gause (1934) The Struggle for Existence. Dover Publications; Reprint edition.
"gause_1934_book_f32"

#' Wolf, Moose, and Fir dynamics from Isle Royale
#'
#' A dataset containing the abundances of wolves, moose, and fir trees
#' from the Isle Royale study of McLaren et al.
#' 
#' @format A data frame with 17 rows and 8 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{year}{Year of measurements}
#'   \item{Species}{Species name}
#'   \item{width}{Width of tree rings}
#'   \item{individuals}{Number of wolf or moose individuals}
#'   \item{AET..mm.}{AET water availablility index}
#' }
#' @source McLaren & Peterson (1994) Wolves, Moose, and Tree Rings on Isle Royale. Science 266:1555-1558.
"mclaren_1994_f03"

#' Huffaker Mite Data
#'
#' A dataset containing the abundances mite species from some of the
#' Huffaker experiments.
#' 
#' @format A data frame with 17 rows and 8 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Species}{Species name}
#'   \item{Weeks}{Experiment week}
#'   \item{Individuals}{Number of individuals}
#'   \item{Treatment}{60 vs. 24-week experiments}
#' }
#' @source Huffaker (1958) Experimental Studies on Predation: Dispersion Factors and Predator-Prey Oscillations. Hilgardia 27: 343–83.
"huffaker_1963"

#' Gause Yeast Data
#'
#' A dataset containing yeast volume and alcohol concentration
#' for two replicates of S. cerevisiae grown in monoculture.
#' 
#' @format A data frame with 17 rows and 8 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Species}{Species name}
#'   \item{Time}{Experiment time in hours}
#'   \item{Alcohol_Percent}{Alcohol concentration, in percent}
#'   \item{Yeast_Volume}{Yeast volume, listed in papers as 'amount'}
#'   \item{Treatment}{Experiment replicate, under two 'somewhat different' growth medium concentrations}
#' }
#' @source Huffaker (1958) Experimental Studies on Predation: Dispersion Factors and Predator-Prey Oscillations. Hilgardia 27: 343–83.
"gause_1934_book_f11"
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
#' @format A data frame with 140 rows and 7 variables:
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
#' @format A data frame with 168 rows and 6 variables:
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
#' @format A data frame with 11 rows and 7 variables:
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

#' Paramecium/Didinium predator-prey experiment
#'
#' A dataset containing the abundances of Paramecium caudatum and Didinium nasutum
#' grown in mixture. Didinium was introduced at different days. 
#' "Volume" refers to a standardized index, meant to make the abundances
#' of species comparable based on their relative sizes.
#'
#' @format A data frame with 62 rows and 7 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Species}{Name of Species: Didinium nasutum and Paramecium caudatum}
#'   \item{Time}{Day of experiment}
#'   \item{Volume}{Volume of Didinium}
#'   \item{Individuals}{Number of Individuals}
#'   \item{Treatment}{Treatments: D. nasutum introduced after 0, 24, 36 and 48 hrs}
#' }
#' @source Gause (1934) The Struggle for Existence. Dover Publications; Reprint edition.
"gause_1934_book_f29"

#' Elementary interaction between Didinium nasutum and Paramecium caudatum 
#'
#' A dataset containing the abundances of Paramecium caudatum and Didinium nasutum
#' grown in mixture. Didinium was introduced at day two. 
#' "Individuals" refers to the number of individuals pro 0.5 c.c..
#'
#' @format A data frame with 12 rows and 6 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Species}{Name of Species: Paramecium caudatum and Didinium nasutum}
#'   \item{Time}{Day of experiment}
#'   \item{Individuals}{Number of Individuals} 
#'   \item{Treatment}{Treatments: Monoculture and Mixture}
#' }
#' @source Gause (1934) The Struggle for Existence. Dover Publications; Reprint edition.
"gause_1934_book_f28"

#' Growth of Stylorzychia  pustulata in Monoculture and in Mixture  
#'
#' A dataset containing the abundances of  Stylorzychia  pustulata cultivated  separately,  
#' and  in  the  mixed  populations  with  Paramecium caudatum and Paramecium aurelia and the 
#' abundances of P. caudatum and P. aurelia grown in mixture with S. pustulata.
#'
#' @format A data frame with 104 rows and 6 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Species}{Name of Species:Paramecium caudatum, Paramecium aurelia and Stylorzychia  pustulata}
#'   \item{Time}{Day of experiment}
#'   \item{Individuals}{Number of Individuals}
#'   \item{Treatment}{Treatments: Monoculture and Mixture(with Species)}
#' }
#' @source Gause (1934) The Struggle for Existence. Dover Publications; Reprint edition.
"gause_1934_book_f26"

#' Growth of Paramecium caudatum and Paramecium aurelia in Monoculture  
#'
#' A dataset containing the abundances and the volume of Paramecium caudatum and 
#' Paramecium aurelia, to determine the differences in reaching the saturating population 
#' regarding Volume and Number of individuals.
#' "Volume" refers to a standardized index, meant to make the abundances
#' of species comparable based on their relative sizes.
#'
#' @format A data frame with 87 rows and 6 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Species}{Name of Species: Paramecium caudatum and Paramecium aurelia}
#'   \item{Time}{Day of experiment}
#'   \item{Volume}{"Volume" of Species}
#'   \item{Individuals}{Number of Individuals}
#' }
#' @source Gause (1934) The Struggle for Existence. Dover Publications; Reprint edition.
"gause_1934_book_f21"

#' Growth of Paramecium caudatum and Paramecium aurelia with wild bacteria  
#'
#' A dataset containing the volume of Paramecium caudatum and 
#' Paramecium aurelia, grown in monoculture on buffered medium with two different 
#' wild bacteria concentrations ("one" and "half loop").
#' "Volume" refers to a standardized index, meant to make the abundances
#' of species comparable based on their relative sizes.
#'
#' @format A data frame with 61 rows and 6 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Species}{Name of Species: Paramecium caudatum and Paramecium aurelia}
#'   \item{Time}{Day of experiment}
#'   \item{Volume}{"Volume" of Species}
#'   \item{Treatment}{Treatments: One Loop and Half Loop}
#' }
#' @source Gause (1934) The Struggle for Existence. Dover Publications; Reprint edition.
"gause_1934_book_f23"

#' Growth of Paramecium caudatum and Paramecium aurelia in Mixture on Half Loop Medium 
#'
#' A dataset containing the volume of Paramecium caudatum and 
#' Paramecium aurelia, grown in monoculture and in mixture on buffered medium with
#' low wild bacteria concentration ("half loop" medium).
#' "Volume" refers to a standardized index, meant to make the abundances
#' of species comparable based on their relative sizes.
#'
#' @format A data frame with 56 rows and 6 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Species}{Name of Species: Paramecium caudatum and Paramecium aurelia}
#'   \item{Time}{Day of experiment}
#'   \item{Volume}{"Volume" of Species}
#'   \item{Treatment}{Treatments: Monoculture and Mixture}
#' }
#' @source Gause (1934) The Struggle for Existence. Dover Publications; Reprint edition.
"gause_1934_book_f24"

#' Growth of Paramecium caudatum and Paramecium aurelia in Mixture on One Loop Medium 
#'
#' A dataset containing the volume of Paramecium caudatum and 
#' Paramecium aurelia, grown in monoculture and in mixture on buffered medium with
#' high wild bacteria concentration ("one loop" medium).
#' "Volume" refers to a standardized index, meant to make the abundances
#' of species comparable based on their relative sizes.
#'
#' @format A data frame with 57 rows and 6 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Species}{Name of Species: Paramecium caudatum and Paramecium aurelia}
#'   \item{Time}{Day of experiment}
#'   \item{Volume}{"Volume" of Species}
#'   \item{Treatment}{Treatments: Monoculture and Mixture}
#' }
#' @source Gause (1934) The Struggle for Existence. Dover Publications; Reprint edition.
"gause_1934_book_f25"

#' Growth of Paramecium caudatum and Stylonychia mytilis in Mixture with Wild bacteria 
#'
#' A dataset containing the abundance of Paramecium caudatum and 
#' Stylonychia mytilis, grown in monoculture and in mixture on buffered medium containing 
#' wild bacteria.
#'
#'
#' @format A data frame with 17 rows and 6 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Species}{Name of Species: Paramecium caudatum and Stylonychia mytilis}
#'   \item{Time}{Day of experiment}
#'   \item{Individuals}{Number of Individuals}
#'   \item{Treatment}{Treatments: Monoculture and Mixture}
#' }
#' @source Gause (1934) The Struggle for Existence. Dover Publications; Reprint edition.
"gause_1934_book_f19"

#' Growth of Paramecium caudatum and Stylonychia mytilis in Mixture  
#'
#' A dataset containing the abundance of Paramecium caudatum and 
#' Stylonychia mytilis, grown in monoculture and in mixture on buffered medium without 
#' wild bacteria.
#'
#'
#' @format A data frame with 28 rows and 6 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Species}{Name of Species: Paramecium caudatum and Stylonychia mytilis}
#'   \item{Time}{Day of experiment}
#'   \item{Individuals}{Number of Individuals}
#'   \item{Treatment}{Treatments: Monoculture and Mixture}
#' }
#' @source Gause (1934) The Struggle for Existence. Dover Publications; Reprint edition.
"gause_1934_book_f18"

#' Growth of Schizosaccaromyces kephir in mixed population - anaerobic
#' 
#' A dataset containing the the  growth  in  volume  of  Schizosaccaromyces  kephir  cultivated 
#' separately  and  in  the  mixed  population (two  series  of  experiments) with Saccharomyces cerevisiae under anaerobic conditions.
#' The Volume is measured in "Amount of yeast", which refers to a standardized index, 
#' based on the alcohol production per Unit of Yeast.
#'
#' @format A data frame with 24 rows and 6 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Species}{Name of Species: Schizosaccaromyces  kephir}
#'   \item{Time}{Hour of experiment}
#'   \item{Volume}{"Amount of Yeast" of Species}
#'   \item{Treatment}{Treatments: Monoculture and Mixture}
#' }
#' @source Gause (1934) The Struggle for Existence. Dover Publications; Reprint edition.
"gause_1934_book_f15"

#' Growth of Schizosaccaromyces kephir and Saccharomyces cerevisiae in mixed population -aerobic
#' 
#' A dataset containing the the  growth  in  volume  of  Schizosaccaromyces  kephir  cultivated 
#' separately  and  in  the  mixed  population with Saccharomyces cerevisiae under aerobic conditions.
#' The Volume is measured in "Amount of yeast", which refers to a standardized index, 
#' based on the alcohol production per Unit of Yeast.
#'
#' @format A data frame with 27 rows and 6 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Species}{Name of Species: Schizosaccaromyces kephir, Saccharomyces cerevisiae and Total_Yeast}
#'   \item{Time}{Hour of experiment}
#'   \item{Volume}{"Amount of Yeast" of Species}
#'   \item{Treatment}{Treatments: Monoculture and Mixture}
#' }
#' @source Gause (1934) The Struggle for Existence. Dover Publications; Reprint edition.
"gause_1934_book_f16"


#' Growth of Saccharomyces cerevisiae in mixed population
#' 
#' A dataset containing the the  growth  in  volume  of  Saccharomyces cerevisiae  cultivated 
#' separately  and  in  the  mixed  population (two  series  of  experiments) with Schizosaccaromyces  kephir 
#' under anaerobic conditions. The Volume is measured in "Amount of yeast", which refers to a standardized index, 
#' based on the alcohol production per Unit of Yeast.
#'
#' @format A data frame with 32 rows and 6 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Species}{Name of Species: Saccharomyces cerevisiae}
#'   \item{Time}{Hour of experiment}
#'   \item{Volume}{"Amount of Yeast" of Species}
#'   \item{Treatment}{Treatments: Monoculture and Mixture}
#' }
#' @source Gause (1934) The Struggle for Existence. Dover Publications; Reprint edition.
"gause_1934_book_f14"

#' Growth of Saccharomyces cerevisiae and Schizosaccaromyces kephir in mixed population
#' 
#' A dataset containing the the  growth  in  volume  of  Saccharomyces cerevisiae and Schizosaccaromyces  kephir cultivated 
#' in  the  mixed  population (two  series  of  experiments) under anaerobic conditions. Gause also measured the volume of 
#' the mixed population. The Volume is measured in "Amount of yeast", which refers to a standardized index, 
#' based on the alcohol production per Unit of Yeast.
#'
#' @format A data frame with 47 rows and 5 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Species}{Name of Species: Saccharomyces cerevisiae, Schizosaccaromyces kephi and Mixed Population}
#'   \item{Time}{Hour of experiment}
#'   \item{Volume}{"Amount of Yeast" of Species}
#' }
#' @source Gause (1934) The Struggle for Existence. Dover Publications; Reprint edition.
"gause_1934_book_f13"

#' Growth of Saccharomyces cerevisiae with additional alcohol
#' 
#' A dataset containing the growth in volume of Saccharomyces cerevisiae cultivated 
#' under anaerobic conditions with added alcohol.Gause measured the effect of alcohol on reaching
#' a saturated population. The saturation is measured in percent of the satured population grown without
#' additional alcohol. 
#'
#' @format A data frame with 6 rows and 5 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Species}{Name of Species: Saccharomyces cerevisiae}
#'   \item{Alcohol}{Additional alcohol in percent}
#'   \item{Population}{Percentage of saturated population reached}
#' }
#' @source Gause (1934) The Struggle for Existence. Dover Publications; Reprint edition.
"gause_1934_book_f12"


#' Growth of Saccharomyces cerevisiae with medium change
#' 
#' A dataset containing the abundance of  Saccharomyces cerevisiae  cultivated 
#' in monoculture with a medium change in different time periods under anaerobic conditions.
#' The Number of Individuals is measured in Number of cells per 1/250 mm3.
#'
#' @format A data frame with 29 rows and 6 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Species}{Name of Species: Saccharomyces cerevisiae}
#'   \item{Time}{Hour of experiment}
#'   \item{Individuals}{Number of cells per 1/250 mm3}
#'   \item{Treatment}{Treatments: medium change every 3, 12, 24 hours and control}
#' }
#' @source Gause (1934) The Struggle for Existence. Dover Publications; Reprint edition.
"gause_1934_book_f10"


#' Growth of Saccharomyces cerevisiae 
#' 
#' A dataset containing the  growth  in  volume  of  Saccharomyces cerevisiae under anaerobic conditions.
#' The Volume is measured in "Amount of yeast", which refers to a standardized index, 
#' based on the alcohol production per Unit of Yeast.
#'
#' @format A data frame with 9 rows and 5 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Species}{Name of Species: Saccharomyces cerevisiae}
#'   \item{Time}{Hour of experiment}
#'   \item{Volume}{"Amount of Yeast" of Species}
#' }
#' @source Gause (1934) The Struggle for Existence. Dover Publications; Reprint edition.
"gause_1934_book_f09"

#' Growth of Paramecium caudatum 
#' 
#' A dataset containing the growth in abundance  of Paramecium caudatum over six days.
#'
#' @format A data frame with 8 rows and 5 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Species}{Name of Species: Paramecium caudatum}
#'   \item{Time}{Day of experiment}
#'   \item{Individuals}{Number of Individuals}
#' }
#' @source Gause (1934) The Struggle for Existence. Dover Publications; Reprint edition.
"gause_1934_book_f04"

#' Raw data of Paramecium caudatum and Paramecium aurelia grown in Monoculture and Mixture 
#'
#' A dataset containing the mean abundances of Paramecium caudatum and 
#' Paramecium aurelia, grown in mixture and monoculture. This dataset contains the mean abundances of three
#' experiments. Note, that for day 20, single values are missing and only the mean is reported.
#'
#' @format A data frame with 104 rows and 6 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Table}{Table number in paper}
#'   \item{Species}{Name of Species: Paramecium caudatum and Paramecium aurelia}
#'   \item{Time}{Day of experiment}
#'   \item{Individuals}{Number of Individuals}
#'   \item{Treatment}{Treatments: Monoculture and Mixture}
#' }
#' @source Gause (1934) The Struggle for Existence. Dover Publications; Reprint edition.
"gause_1934_book_app_t03"

#' Alcohol production of Saccharomyces cerevisiae and Schizosaccharomyces kephir 
#' 
#' A dataset containing the  alcohol production of Saccharomyces cerevisiae and 
#' Schizosaccharomyces kephir cultivated under anaerobic and aerobic conditions, 
#' in percent and per unit of yeast volume.
#' 
#'
#' @format A data frame with 28 rows and 7 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Table}{Table number in paper}
#'   \item{Species}{Name of Species: Saccharomyces cerevisiae, Schizosaccharomyces kephir}
#'   \item{Time}{Hour of experiment}
#'   \item{Alcohol}{Alcohol production in percent}
#'   \item{Alcohol.Yeast_Volume}{Alcohol production per unit of yeast volume}
#'   \item{Treatment}{Treatments: Anaerobic and Aerobic}
#' }
#' @source Gause (1934) The Struggle for Existence. Dover Publications; Reprint edition.
"gause_1934_book_app_t02"

#' Raw data of Paramecium caudatum and Paramecium aurelia grown on different media
#' 
#' A dataset containing the abundance of Paramecium caudatum and 
#' Paramecium aurelia, grown in monoculture and in mixture on buffered medium with
#' high wild bacteria concentration ("one loop" medium) and low wild bacteria concentration 
#' ("half loop" medium). The number of individuals is reported for monoculture and the 
#' number of individuals of the species in the mixture.
#' 
#'
#' @format A data frame with 68 rows and 7 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Table}{Table number in paper}
#'   \item{Species}{Name of Species: Paramecium caudatum and Paramecium aurelia}
#'   \item{Time}{Day of experiment}
#'   \item{Individuals}{Number of Individuals}
#'   \item{Individuals_Mixture}{Number of Individuals per Species in Mixture}
#'   \item{Treatment}{Treatments: One Loop and Half Loop}
#' }
#' @source Gause (1934) The Struggle for Existence. Dover Publications; Reprint edition.
"gause_1934_book_app_t04"

#' Growth of population of the flour beetle Tribolium confusum in 16 and 64 grams of flour
#' 
#' A dataset containing the abundance of Tribolium confusum, grown in monoculture with 
#' different quantities of food (flour). Gause's goal was to determine the influence of ecological
#' factors on population growth.
#' 
#'
#' @format A data frame with 18 rows and 6 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Species}{Name of Species: Tribolium confusum}
#'   \item{Time}{Day of experiment}
#'   \item{Individuals}{Number of Individuals}
#'   \item{Treatment}{Treatments:16 and 64g flour per starting beetle pair}
#' }
#' @source Gause (1931) The influence of ecological factors on the size of population. The American Naturalist 65:696, 70-76 
"gause_1931_AmN_f01"

#' The influence of quantity of food on the asymptotic population of Triboliurn confusum.
#' 
#' A dataset containing the population size of Tribolium confusum at the upper asymptote,
#' as a characteristic for the population beeing in equilibrium, under different quantities of food (flour).
#' Gause's goal was to determine the influence of ecological factors on population growth.
#' 
#'
#' @format A data frame with 4 rows and 5 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Species}{Name of Species: Tribolium confusum}
#'   \item{Individuals}{Number of Individuals at population equlibrium}
#'   \item{Treatment}{Treatments:16, 32, 64 and 128g flour per starting beetle pair}
#' }
#' @source Gause (1931) The influence of ecological factors on the size of population. The American Naturalist 65:696, 70-76 
"gause_1931_AmN_f02"

#' The influence of temperature on the asymptotic population of Moina macrocopa.
#' 
#' A dataset containing the population size of Moina macrocopa at the upper asymptote,
#' as a characteristic for the population beeing in equilibrium, under different temperatures.
#' Gause's goal was to determine the influence of ecological factors on population growth.
#' 
#'
#' @format A data frame with 3 rows and 5 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Species}{Name of Species: Tribolium confusum}
#'   \item{Individuals}{Number of Individuals at population equlibrium}
#'   \item{Treatment}{Treatments:20, 25 and 35 degrees Celcius}
#' }
#' @source Gause (1931) The influence of ecological factors on the size of population. The American Naturalist 65:696, 70-76 
"gause_1931_AmN_f03"


#' Interaction between predators (Cheyletus eruditus) and prey (Aleuiroglyphus agilis) on millet, wheat flour and a mixture of these substances.
#' 
#' A dataset containing the abundance of Cheyletus eruditus and Aleuiroglyphus agilis,
#' as apredator-prey system under different food conditions for the prey (wheat and millet).
#' Gause's goal was to determine the influence of ecological factors on predator-prey dynamics.
#' The number of individuals is reported as Individuals per 0.2 g prey food.
#' 
#'
#' @format A data frame with 34 rows and 6 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Time}{Day of experiment}
#'   \item{Species}{Name of Species: Cheyletus eruditus and Aleuiroglyphus agilis}
#'   \item{Individuals}{Number of Individuals per 0.2 g}
#'   \item{Treatment}{Treatments: Wheat, Millet, Wheat+Millet}
#' }
#' @source Gause (1936) Further Studies of Interaction between Predators and Prey. Journal of Animal Ecology, vol. 5, pp. 1-18.
"gause_1936_AnE_f01"

#' Interaction  between  predators  (Cheyletus eruditus) and  prey  (Aleuroglyphus agilis) with occasional immigration
#' 
#' A dataset containing the abundance of Cheyletus eruditus and Aleuiroglyphus agilis,
#' as apredator-prey system with  an  occasional  immigration  of  the  prey  on  the  63rd day.
#' The number of individuals is reported as Individuals per 0.2 g prey food. Wheat flour was used as food.
#' 
#'
#' @format A data frame with 22 rows and 6 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Time}{Day of experiment}
#'   \item{Species}{Name of Species: Cheyletus eruditus and Aleuiroglyphus agilis}
#'   \item{Individuals}{Number of Individuals per 0.2 g}
#'   \item{Treatment}{Treatments: Immigration or NA}
#' }
#' @source Gause (1936) Further Studies of Interaction between Predators and Prey. Journal of Animal Ecology, vol. 5, pp. 1-18.
"gause_1936_AnE_f03.1"

#' Interaction  between  predators  (Cheyletus eruditus) and  prey  (Aleuroglyphus agilis) with artifical immigration
#' 
#' A dataset containing the abundance of Cheyletus eruditus and Aleuiroglyphus agilis,
#' as apredator-prey system with  an artificial everyday immigration  of  predator and prey .
#' The number of individuals is reported as Individuals per 0.2 g prey food. Wheat flour was used as food.
#' 
#'
#' @format A data frame with 24 rows and 6 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Time}{Day of experiment}
#'   \item{Species}{Name of Species: Cheyletus eruditus and Aleuiroglyphus agilis}
#'   \item{Individuals}{Number of Individuals per 0.2 g}
#'   \item{Treatment}{Treatment: Immigration}
#' }
#' @source Gause (1936) Further Studies of Interaction between Predators and Prey. Journal of Animal Ecology, vol. 5, pp. 1-18.
"gause_1936_AnE_f03.3a"

#' Interaction  between  predators  (Cheyletus eruditus) and  prey  (Aleuroglyphus agilis) with artifical immigration
#' 
#' A dataset containing the abundance of Cheyletus eruditus and Aleuiroglyphus agilis,
#' as apredator-prey system with  an artificial immigration  of  predator and prey every 8th day.
#' The number of individuals is reported as Individuals per 0.2 g prey food. Wheat flour was used as food.
#' 
#'
#' @format A data frame with 26 rows and 6 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Time}{Day of experiment}
#'   \item{Species}{Name of Species: Cheyletus eruditus and Aleuiroglyphus agilis}
#'   \item{Individuals}{Number of Individuals per 0.2 g}
#'   \item{Treatment}{Treatment: Immigration}
#' }
#' @source Gause (1936) Further Studies of Interaction between Predators and Prey. Journal of Animal Ecology, vol. 5, pp. 1-18.
"gause_1936_AnE_f03.3b"

#' Interaction  between  predators  (Cheyletus eruditus) and  prey  (Aleuroglyphus agilis)-Raw data
#' 
#' A dataset containing the abundance of Cheyletus eruditus and Aleuiroglyphus agilis,
#' as a predator-prey system on semoletta and wheat flour.  A fraction at the beginning of  
#' each experiment shows the initial  relation between predators and prey;  e.g. 10/5 means 10 prey 
#' and 5 predators (reported in variable "Treatment"). Dataset includes age structured population abundances.
#' The number of individuals is reported as Individuals per 0.2 g prey food. Wheat flour was used as food.
#' 
#'
#' @format A data frame with 191 rows and 12 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Table}{Table number in paper}
#'   \item{Time}{Day of experiment}
#'   \item{Species}{Name of Species: Cheyletus eruditus and Aleuiroglyphus agilis}
#'   \item{Total_Individuals}{Number of all Individuals of Species per 0.2 g}
#'   \item{Female}{Number of female individuals per 0.2 g}
#'   \item{Male}{Number of male individuals per 0.2 g}
#'   \item{Imago}{Number of adult Individuals per 0.2 g}
#'   \item{Hexapod}{Number of hexapod larvae stage Individuals per 0.2 g}
#'   \item{Octapod}{Number of octapod larvae stage Individuals per 0.2 g}
#'   \item{Initial_Fraction}{Initial Number of prey/predator}
#'   \item{Treatment}{Treatments: Wheat and Semoletta}
#' }
#' @source Gause (1936) Further Studies of Interaction between Predators and Prey. Journal of Animal Ecology, vol. 5, pp. 1-18.
"gause_1936_AnE_t02"


#' Interaction  between  predators  (Paramecium bursaria) and  prey  (Saccharomyces exiguus)
#' 
#' A dataset containing the abundance of Paramecium bursaria and Saccharomyces exiguus,
#' as a predator-prey system.  The primary difference among experimental replicates
#' is the initial abundance of the two species.
#' The number of individuals is reported as Individuals per 0.5 cm3 for Paramecium,
#' and as number of individuals per 0.1 cm3 for Saccharomyces.
#' 
#'
#' @format A data frame with 266 rows and 6 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Table}{Table number in paper}
#'   \item{Experiment}{Experimental replicate number}
#'   \item{Time}{Day of experiment}
#'   \item{Species}{Name of Species: Cheyletus eruditus and Aleuiroglyphus agilis}
#'   \item{Individuals}{Number of all Individuals of Species per 0.2 g}
#' }
#' @source Gause (1936) Further Studies of Interaction between Predators and Prey. Journal of Animal Ecology, vol. 5, pp. 1-18.
"gause_1936_AnE_t03"

#' The influence of temperature on the growth of the yeast Saccharomyces cerevisiae
#'
#' A dataset containing the abundance of Saccharomyces cerevisiae, grown in different temperatures (5.7 to 41 degrees C).
#' The Volume is measured in "Amount of yeast", which refers to a standardized index, based on the alcohol production per Unit of Yeast.
#' 
#'
#' @format A data frame with 102 rows and 7 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Table}{Table number in paper}
#'   \item{Experiment}{Number of series: 1,2 or 3}
#'   \item{Species}{Name of Species: Saccharomyces cerevisiae}
#'   \item{Time}{Hour of experiment}
#'   \item{Volume}{"Amount of Yeast" of Species}
#'   \item{Treatment}{Treatments: Temperatures (5.7 to 41 degrees C)}
#' }
#' @source Gause (1932) Ecology of Populations. The Quarterly Review of Biology 7, vol. 1, pp. 27-46 
"gause_1932_QR_t05"

#' Raw data of Stylonychia pustulata in monoculture and mixture with and Paramecium aurelia and P. caudatum 
#'
#' A dataset containing the abundances of Stylonychia pustulata grown in monoculture and mixture with P. aurelia 
#' and P. caudatum and the abundances of P. aurelia and P. caudautum in this mixtures on the medium of Osterhout. 
#' This dataset contains the raw data of three different experiments: Stylonychia pustulata grown in monoculture, in mixture with P.aurelia
#' and in mixture wit P.caudatum. The abundances of three to five cultures per experiment and the calculated mean abundances of the
#' experiments are reported. Note, that for day 20 - 25, single values are missing and only the mean is reported.
#'
#' @format A data frame with 575 rows and 8 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Table}{Table number in paper}
#'   \item{Time}{Day of experiment}
#'   \item{Experiment}{Number of experiment: 1,2 or 3}
#'   \item{Culture}{Number of culture: 1,2,3,4,5 or Mean}
#'   \item{Species}{Name of Species: Stylonychia pustulata, Paramecium caudatum and Paramecium aurelia}
#'   \item{Individuals}{Number of Individuals}
#'   \item{Treatment}{Treatments: Monoculture and Mixture P.aurelia and Mixture P.caudatum}
#' }
#' @source Gause (1934) The Struggle for Existence. Dover Publications; Reprint edition.
"gause_1934_book_app_t05"

#' The elementary interaction between Didinium nasutum and Paramecium caudatum
#'
#' A dataset containing the abundances of Didinium nasutum and Paramecium caudatum grown in mixture on the medium of Osterhout. 
#'
#' @format A data frame with 16 rows and 6 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Time}{Day of experiment}
#'   \item{Species}{Name of Species: Didinium nasutum and Paramecium caudatum}
#'   \item{Individuals}{Number of Individuals}
#'   \item{Treatment}{Treatment: Osterhout medium}
#' }
#' @source Gause (1934) The Struggle for Existence. Dover Publications; Reprint edition.
"gause_1934_book_f30"


#' The interaction between Didinium nasutum and Paramecium caudatum on oat medium
#'
#' A dataset containing the abundances of Didinium nasutum and Paramecium caudatum grown in mixture on oat medium with sediment. 
#'
#' @format A data frame with 12 rows and 6 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Time}{Day of experiment}
#'   \item{Species}{Name of Species: Didinium nasutum and Paramecium caudatum}
#'   \item{Individuals}{Number of Individuals}
#'   \item{Treatment}{Treatment: Oat medium}
#' }
#' @source Gause (1934) The Struggle for Existence. Dover Publications; Reprint edition.
"gause_1934_book_f31"


#' The interaction between Paramecium bursaria and Schizosaccharomyces pombe
#'
#' A dataset containing the abundances of Paramecium bursaria and Schizosaccharomyces pombe grown in mixture.
#'
#' @format A data frame with 36 rows and 5 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Figure}{Figure number in paper}
#'   \item{Time}{Day of experiment}
#'   \item{Species}{Name of Species: Paramecium bursaria and Schizosaccharomyces pombe}
#'   \item{Individuals}{Number of Individuals}
#' }
#' @source Gause (1934) The Struggle for Existence. Dover Publications; Reprint edition.
"gause_1934_book_f39.1"


#' Raw data on the abundances and volumes of Saccharomyces cerevisiae and Schizosaccharomyces kephir
#'
#' A dataset containing the abundances (number of cells) and volumes of Saccharomyces cerevisiae 
#' and Schizosaccharomyces kephir grown in monoculture and in mixture.
#' The data for two experiments with differnet time periods is reported.
#'
#' @format A data frame with 60 rows and 10 variables:
#' \describe{
#'   \item{Paper}{Paper from which data are drawn}
#'   \item{Table}{Table number in paper}
#'   \item{Experiment}{Number of experiment: 1 or 2}
#'   \item{Species}{Name of Species: Saccharomyces cerevisiae and Schizosaccharomyces kephir}
#'   \item{Time}{Day of experiment}
#'   \item{Volume_Species}{Volume of yeast species in the mixture, estimated from counted cells}
#'   \item{Squares}{Number of Squares counted}
#'   \item{Individuals_Square}{Average Number of cells per Square}
#'   \item{Volume_Total}{Total volume of yeast}
#'   \item{Treatment}{Treatments: Monoculture and Mixture}
#'  
#' }
#' @source Gause (1934) The Struggle for Existence. Dover Publications; Reprint edition.
"gause_1934_book_app_t01"

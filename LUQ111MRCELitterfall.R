# Package ID: knb-lter-luq.111.1441410 Cataloging System:https://pasta.edirepository.org.
# Data set title: Litterfall in tabonuco (subtropical wet) forest in the Luquillo Experimental Forest, Puerto Rico (MRCE Litterfall data).
# Data set creator:  Alonso Ramirez -
# Contact:  Alonso Ramirez -    - aramirez@ramirezlab.net
# Stylesheet for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@Virginia.edu
#
#install package tidyverse if not already installed
if(!require(tidyverse)){ install.packages("tidyverse") }
library("tidyverse")
infile1 <- trimws("https://pasta.lternet.edu/package/data/eml/knb-lter-luq/111/1441410/8af4677e70ad821ef01dda755712b155")
infile1 <-sub("^https","http",infile1)
# This creates a tibble named: dt1
	dt1 <-read_delim(infile1
                ,delim=","
                ,skip=1
                    , col_names=c(
                        "DATE",
                        "Plot.at.El.Verde.study.area",
                        "Species.name",
                        "Weight.of.specific.Species.leaves",
                        "Weight.of.Wood",
                        "Weight.of.Miscellaneous",
                        "Weight.of.Fruits_seeds_flowers.in.g",
                        "Sum.of.weight.of.all.leaves.in.plot",
                        "Days_Since_Last_Collection",
                        "Weight.of.Total.leaves.semicolon..Wood.semicolon..and.Miscellaneous",
                        "Number.of.baskets.sampled",
                        "Weight.of.other.leaves.in.sample.from.a.plot",
                        "Comments.about.samples"   ),
                    col_types=list(
                        col_character(),
                        col_character(),
                        col_character(),
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_character()),
                        na=c(" ",".","NA","")  )


# Observed issues when reading the data. An empty list is good!
problems(dt1)
# Here is the structure of the input data tibble:
glimpse(dt1)
# And some statistical summaries of the data
summary(dt1)
# Get more details on character variables

summary(as.factor(dt1$Plot.at.El.Verde.study.area))
summary(as.factor(dt1$Species.name))
summary(as.factor(dt1$Comments.about.samples))
infile2 <- trimws("https://pasta.lternet.edu/package/data/eml/knb-lter-luq/111/1441410/af263f5b236f0c1897f664169fcd12eb")
infile2 <-sub("^https","http",infile2)
# This creates a tibble named: dt2
	dt2 <-read_delim(infile2
                ,delim=","
                ,skip=1
                    , col_names=c(
                        "DATE",
                        "Block.at.El.Verde.study.area",
                        "Plot.at.El.Verde.study.area",
                        "Weight.of.leaves.of.corresponding.species..hyphen.code.Dacexc.hyphen.",
                        "Weight.of.leaves.of.corresponding.species..hyphen.code.manbid.hyphen.",
                        "Weight.of.leaves.of.corresponding.species..hyphen..Cecsch",
                        "Weight.of.leaves.of.corresponding.species..hyphen.code.Buccap",
                        "Weight.of.leaves.of.corresponding.species..hyphen..code.Slober",
                        "Weight.of.other.leaves.in.sample.from.a.plot",
                        "Sum.of.weight.of.all.leaves.in.plot",
                        "Weight.of.Wood",
                        "Weight.of.Miscellaneous",
                        "Weight.of.Total.leaves.semicolon..Wood.semicolon..and.Miscellaneous",
                        "Weight.of.fruits.semicolon..seeds.semicolon..and.flowers.in.sample",
                        "Number.of.baskets.sampled",
                        "Comments.about.samples"   ),
                    col_types=list(
                        col_character(),
                        col_character(),
                        col_character(),
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_number() ,
                        col_character()),
                        na=c(" ",".","NA","")  )


# Observed issues when reading the data. An empty list is good!
problems(dt2)
# Here is the structure of the input data tibble:
glimpse(dt2)
# And some statistical summaries of the data
summary(dt2)
# Get more details on character variables

summary(as.factor(dt2$Block.at.El.Verde.study.area))
summary(as.factor(dt2$Plot.at.El.Verde.study.area))
summary(as.factor(dt2$Comments.about.samples))





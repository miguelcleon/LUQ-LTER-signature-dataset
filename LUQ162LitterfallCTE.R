# Package ID: knb-lter-luq.162.862759 Cataloging System:https://pasta.edirepository.org.
# Data set title: Canopy Trimming Experiment (CTE) Litterfall.
# Data set creator:  Jess Zimmerman -
# Metadata Provider:  Alonso Ramirez -
# Contact:  Miguel Leon -    - miguel.leon@unh.edu
# Stylesheet v2.11 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu

inUrl1  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-luq/162/862759/09e505668e2aeab132d41936bd874067"
infile1 <- tempfile()
try(download.file(inUrl1,infile1,method="curl"))
if (is.na(file.size(infile1))) download.file(inUrl1,infile1,method="auto")


 dt1 <-read.csv(infile1,header=F
          ,skip=1
            ,sep=","
                ,quot='"'
        , col.names=c(
                    "Collection_Date",
                    "CTE.Block.identifier",
                    "CTE.Plot.Identifier",
                    "Oven.hyphen.dry.weight.of.leaves.in.grams",
                    "Oven.hyphen.dry.weight.of.wood.in.grams",
                    "Oven.hyphen.dry.weight.of.miscelaneous.plant.parts",
                    "Oven.hyphen.dry.weight.of.flowers",
                    "fruits.and.seeds.in.grams",
                    "Number.of.days.of.litter.accumulation",
                    "Length.of.new.palm.frond.in.baskets",
                    "Remarks.on.data.and.baskets.for.canopy.trimming"    ), check.names=TRUE)

unlink(infile1)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt1$CTE.Block.identifier)!="factor") dt1$CTE.Block.identifier<- as.factor(dt1$CTE.Block.identifier)
if (class(dt1$CTE.Plot.Identifier)!="factor") dt1$CTE.Plot.Identifier<- as.factor(dt1$CTE.Plot.Identifier)
if (class(dt1$Oven.hyphen.dry.weight.of.leaves.in.grams)=="factor")
  dt1$Oven.hyphen.dry.weight.of.leaves.in.grams <-as.numeric(levels(dt1$Oven.hyphen.dry.weight.of.leaves.in.grams))[as.integer(dt1$Oven.hyphen.dry.weight.of.leaves.in.grams) ]
if (class(dt1$Oven.hyphen.dry.weight.of.leaves.in.grams)=="character") dt1$Oven.hyphen.dry.weight.of.leaves.in.grams <-as.numeric(dt1$Oven.hyphen.dry.weight.of.leaves.in.grams)
if (class(dt1$Oven.hyphen.dry.weight.of.wood.in.grams)=="factor") dt1$Oven.hyphen.dry.weight.of.wood.in.grams <-as.numeric(levels(dt1$Oven.hyphen.dry.weight.of.wood.in.grams))[as.integer(dt1$Oven.hyphen.dry.weight.of.wood.in.grams) ]
if (class(dt1$Oven.hyphen.dry.weight.of.wood.in.grams)=="character") dt1$Oven.hyphen.dry.weight.of.wood.in.grams <-as.numeric(dt1$Oven.hyphen.dry.weight.of.wood.in.grams)
if (class(dt1$Oven.hyphen.dry.weight.of.miscelaneous.plant.parts)=="factor") dt1$Oven.hyphen.dry.weight.of.miscelaneous.plant.parts <-as.numeric(levels(dt1$Oven.hyphen.dry.weight.of.miscelaneous.plant.parts))[as.integer(dt1$Oven.hyphen.dry.weight.of.miscelaneous.plant.parts) ]
if (class(dt1$Oven.hyphen.dry.weight.of.miscelaneous.plant.parts)=="character")
  dt1$Oven.hyphen.dry.weight.of.miscelaneous.plant.parts <-as.numeric(dt1$Oven.hyphen.dry.weight.of.miscelaneous.plant.parts)
  dt1$fruits.and.seeds.in.grams <-as.numeric(dt1$fruits.and.seeds.in.grams)
dt1$Oven.hyphen.dry.weight.of.flowers <-as.numeric(dt1$Oven.hyphen.dry.weight.of.flowers)
#  if (class(dt1$Oven.hyphen.dry.weight.of.flowers,.fruits.and.seeds.in.grams)=="factor") dt1$Oven.hyphen.dry.weight.of.flowers,
# .fruits.and.seeds.in.grams <
# .fruits.and.seeds.in.grams))[as.integer(dt1$Oven.hyphen.dry.weight.of.flowers,
# .fruits.and.seeds.in.grams) ]
# dt1$Oven.hyphen.dry.weight.of.flowers <-as.numeric(dt1$Oven.hyphen.dry.weight.of.flowers)
#     if (class(dt1$Oven.hyphen.dry.weight.of.flowers,.fruits.and.seeds.in.grams)=="character")
# dt1$Oven.hyphen.dry.weight.of.flowers,
# .fruits.and.seeds.in.grams <-as.numeric(dt1$Oven.hyphen.dry.weight.of.flowers,.fruits.and.seeds.in.grams)
if (class(dt1$Number.of.days.of.litter.accumulation)=="factor") dt1$Number.of.days.of.litter.accumulation <-as.numeric(levels(dt1$Number.of.days.of.litter.accumulation))[as.integer(dt1$Number.of.days.of.litter.accumulation) ]
if (class(dt1$Number.of.days.of.litter.accumulation)=="character") dt1$Number.of.days.of.litter.accumulation <-as.numeric(dt1$Number.of.days.of.litter.accumulation)
if (class(dt1$Length.of.new.palm.frond.in.baskets)=="factor") dt1$Length.of.new.palm.frond.in.baskets <-as.numeric(levels(dt1$Length.of.new.palm.frond.in.baskets))[as.integer(dt1$Length.of.new.palm.frond.in.baskets) ]
if (class(dt1$Length.of.new.palm.frond.in.baskets)=="character") dt1$Length.of.new.palm.frond.in.baskets <-as.numeric(dt1$Length.of.new.palm.frond.in.baskets)
if (class(dt1$Remarks.on.data.and.baskets.for.canopy.trimming)!="factor") dt1$Remarks.on.data.and.baskets.for.canopy.trimming<- as.factor(dt1$Remarks.on.data.and.baskets.for.canopy.trimming)

# Convert Missing Values to NA for non-dates



# Here is the structure of the input data frame:
str(dt1)
attach(dt1)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(Collection_Date)
summary(CTE.Block.identifier)
summary(CTE.Plot.Identifier)
summary(Oven.hyphen.dry.weight.of.leaves.in.grams)
summary(Oven.hyphen.dry.weight.of.wood.in.grams)
summary(Oven.hyphen.dry.weight.of.miscelaneous.plant.parts)
summary(Oven.hyphen.dry.weight.of.flowers,.fruits.and.seeds.in.grams)
summary(Number.of.days.of.litter.accumulation)
summary(Length.of.new.palm.frond.in.baskets)
summary(Remarks.on.data.and.baskets.for.canopy.trimming)
                # Get more details on character variables

summary(as.factor(dt1$CTE.Block.identifier))
summary(as.factor(dt1$CTE.Plot.Identifier))
summary(as.factor(dt1$Remarks.on.data.and.baskets.for.canopy.trimming))
detach(dt1)






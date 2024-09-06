library(tidyverse)
source('./LUQ162LitterfallCTE.R')

ctelitterfall <- dt1
# how big are the cte plots?
# 20x20 meters 3 control plots
# total area of 1,200 m2
# 1000 / 2400 = 0.4166666666666667
# 10 baskets in each plot
# because both studies had 10 baskets we think stayed the same size no correction is needed to compare the
# values from the two studies.
ctelitterfall$Date <- as.Date(ctelitterfall$Collection_Date, format="%Y-%m-%d")
summary(ctelitterfall)

ctelitterfall <- ctelitterfall %>% filter((CTE.Block.identifier =="A" & CTE.Plot.Identifier ==1) |
  (CTE.Block.identifier =="B" & CTE.Plot.Identifier ==1) | (CTE.Block.identifier =="C" & CTE.Plot.Identifier==4)) %>%
  select(Date,CTE.Block.identifier, CTE.Plot.Identifier, Oven.hyphen.dry.weight.of.leaves.in.grams, Oven.hyphen.dry.weight.of.wood.in.grams,
         Oven.hyphen.dry.weight.of.miscelaneous.plant.parts, Oven.hyphen.dry.weight.of.flowers,
         fruits.and.seeds.in.grams, Number.of.days.of.litter.accumulation, Length.of.new.palm.frond.in.baskets) %>%
  rename(Date=Date, CTE.Block.identifier=CTE.Block.identifier, CTE.Plot.Identifier=CTE.Plot.Identifier,
         weight.of.leaves.in.grams= Oven.hyphen.dry.weight.of.leaves.in.grams,
         weight.of.wood.in.grams= Oven.hyphen.dry.weight.of.wood.in.grams,
         weight.of.miscelaneous.plant.parts= Oven.hyphen.dry.weight.of.miscelaneous.plant.parts,
         weight.of.flowers= Oven.hyphen.dry.weight.of.flowers,
         fruits.and.seeds.in.grams= fruits.and.seeds.in.grams,
         Number.of.days.of.litter.accumulation= Number.of.days.of.litter.accumulation,
         Length.of.new.palm.frond.in.baskets= Length.of.new.palm.frond.in.baskets)


# MRCE litter from 10 plots 10x10 meter
# 1,000 m2
# 1.25, 1.35,
# 10 baskets per plot
# used to be 4 blocks and 3 treatments
source('./LUQ111MRCELitterfall.R')
MRCEEVlitterfall <- dt2
summary(MRCEEVlitterfall)
MRCEEVlitterfall$Date <- as.Date(MRCEEVlitterfall$DATE, format="%m/%d/%Y")
MRCEEVlitterfall <- MRCEEVlitterfall %>%
  select(Date,Plot.at.El.Verde.study.area, Block.at.El.Verde.study.area, Weight.of.Wood,
         Weight.of.Miscellaneous, Weight.of.fruits.semicolon..seeds.semicolon..and.flowers.in.sample, Sum.of.weight.of.all.leaves.in.plot,
         Number.of.baskets.sampled, Weight.of.other.leaves.in.sample.from.a.plot, Comments.about.samples) %>%
  rename(Date=Date, Plot.at.El.Verde.study.area=Plot.at.El.Verde.study.area, Block.at.El.Verde.study.area=Block.at.El.Verde.study.area,
          weight.of.wood.in.grams=Weight.of.Wood,
         Weight.of.Misc=Weight.of.Miscellaneous,
         fruits.and.seeds.in.grams=Weight.of.fruits.semicolon..seeds.semicolon..and.flowers.in.sample,
         weight.of.leaves.in.grams=Sum.of.weight.of.all.leaves.in.plot,
         Number.of.baskets.sampled=Number.of.baskets.sampled,
         Weight.of.other.leaves.in.sample=Weight.of.other.leaves.in.sample.from.a.plot,
         Comments.about.samples=Comments.about.samples)
summary(ctelitterfall)
summary(MRCEEVlitterfall)

ctelitterfall <- ctelitterfall %>%
  rename(weight.of.misc.in.grams = weight.of.miscelaneous.plant.parts)

MRCEEVlitterfall <- MRCEEVlitterfall %>%
  rename(weight.of.misc.in.grams = Weight.of.Misc)

# Now both dataframes have similar column names

# Append the two dataframes using bind_rows
combined_litterfall <- bind_rows(ctelitterfall, MRCEEVlitterfall)

# View the combined summary to ensure the data has been appended properly
summary(combined_litterfall)

combined_litterfall_daily <- combined_litterfall %>%
  group_by(Date) %>%
  summarise(across(starts_with("weight"), sum, na.rm = TRUE),
            fruits.and.seeds.in.grams = sum(fruits.and.seeds.in.grams, na.rm = TRUE),
            Number.of.days.of.litter.accumulation = sum(Number.of.days.of.litter.accumulation, na.rm = TRUE),
            .groups = 'drop')


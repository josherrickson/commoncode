data(airquality)
airquality$Month <- as.factor(airquality$Month)
mod <- lm(Ozone ~ Solar.R*Month, data=airquality)

library(lsmeans)
# Obtain estimated slope in each subgroup.
# Requires continuous*categorical interaction to be interesting
trends <- lstrends(mod, "Month", "Solar.R")
# Test between each subgroup
pairs(trends)

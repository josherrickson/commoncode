data(airquality)
airquality$Month <- as.factor(airquality$Month)
mod <- lm(Ozone ~ Solar.R*Month, data=airquality)

# lsmeans 2.23
library(lsmeans)
# Obtain estimated slope in each subgroup.
# Requires continuous*categorical interaction to be interesting
trends <- lstrends(mod, "Month", "Solar.R")
# trends now contains the effect of Solar.R in each Month. This is
# equivalent to re-running the model 5 times, with each different
# Month as baseline.

# Now we can test whether the effect of Solar.R differs in each month.
pairs(trends)
# All p.values > .05, so there's no evidence that the effect differs,
# although Month5 vs Month8 is showing some evidence.

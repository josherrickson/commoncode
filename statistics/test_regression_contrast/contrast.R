data(airquality)
airquality$Month <- as.factor(airquality$Month)

mod <- lm(Ozone ~ Wind + Temp * Month, data=airquality)

# multcomp 1.4.4 on OS X
library(multcomp)

# Create a row vector (matrix) that sums of 1. Each entry corresponds
# to a coefficient in `mod` (including Intercept). Define the
# hypotheses, e.g., to test whether Temp has the same effect in Month7
# and Month8, we're testing H_0: b_t:m7 = b_t:m8, or H_0 b_t:m7 -
# b_t:m8 = 0. So put a 1 for Month7 and -1 for Month8 (sign
# irrelevant).
cont <- matrix(c(0,0,0,0,0,0,0,0,1,-1,0),
               nrow=1) # `nrow = 1` creates a row vector.
# Names aren't needed, but may make designing contrasts easier for
# larger models.
colnames(cont) <- names(mod$coef)
summary(glht(mod, cont))
mod$coef[9] - mod$coef[10] # Double checking test statistic
# Not significant, so we cannot differentiate the effect of Temp in
# the two months.

# Test for effect of Wind different than effect of Temp
cont <- matrix(c(0,1,-1,0,0,0,0,0,0,0,0), 1)
colnames(cont) <- names(mod$coef)
summary(glht(mod, cont))
mod$coef[2] - mod$coef[3]
# Significant, so effect of Wind and Temp are not equal. (Not
# surprising due to different scales!

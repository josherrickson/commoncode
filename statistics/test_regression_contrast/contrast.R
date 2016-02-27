data(airquality)
airquality$Month <- as.factor(airquality$Month)

mod <- lm(Ozone ~ Wind + Temp * Month, data=airquality)

library(multcomp)

# cont must sum to 0.
# E.g. test for different Temp slope in months 7/8
cont <- matrix(c(0,0,0,0,0,0,0,0,1,-1,0),1)
colnames(cont) <- names(mod$coef)
summary(glht(mod, cont))
mod$coef[9] - mod$coef[10]

# E.g. test for effect of Wind different than effect of Temp
cont <- matrix(c(0,1,-1,0,0,0,0,0,0,0,0), 1)
colnames(cont) <- names(mod$coef)
summary(glht(mod, cont))
mod$coef[2] - mod$coef[3]

# lsmeans 2.23
library(lsmeans)
data(oranges)
# Days is our factor of interest, price is continuous
summary(orange.lm <- lm(sales1 ~ day + price1, data = oranges))
# Create marginal mean per day, at mean per other predictors. E.g.,
# lsmean for Day 1 is (Intercept) + mean(price1)*beta_price1
# lsmean for Day 2 is (Intercept) + mean(price1)*beta_price1 + beta_day2
(days.pmm <- pmmeans(orange.lm, "day"))
# Create all pairwise comparisons
(pairs.days <- pairs(days.pmm))
plot(days.pmm)
plot(pairs.days)

# We can "group" days, similar to Tukey type outputs.
# multcompView 0.1-7 with multcomp 1.4-5
library(multcompView)
cld(days.pmm)
# This plots same as plot(days.lsm), but orders by mean.
plot(cld(days.pmm))

# Creating marginal means at different levels of coefficients.
# `by` controls display, `at` controls values.
# So you can pass multiple arguments to `at` without cluttering output
days.ppm.by.price1 <- pmmeans(orange.lm, "day", by = "price1", at = list(price1 = c(40, 50)))
pairs(days.ppm.by.price1)
cld(days.ppm.by.price1)

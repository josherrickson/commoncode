# lmer4 1.1.11
library(lme4)
data(sleepstudy)
mod <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)

summary(mod)
# No p-values are given for the fixed effects.

# lmerTest 2.0.30
library(lmerTest)
# Note that the *exact* same code is run. `lmerTest` overloads `lmer`
# to add the p-value calculations.
mod <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
summary(mod)

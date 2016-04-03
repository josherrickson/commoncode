# Goal is a interactive 3d surface plot of the function defined in
# `func` below, e.g., a regression model. If a `lm`, `glm` or similar
# object exists, you culd use `predict(model, newdata=c(x1,x2))` or
# similar.

# length shouldn't be too high (for speed) but lower values will be
# coarser. If formula has lots of noise, try increasing it.
x1 <- seq(0, 50, length=30)
x2 <- seq(0, 0.55, length=30)

func <- function(x1, x2) {
  47.853 + 0.352*x1 - 0.009*x1^2 - 3.634*x1*x2 + 0.101*x1^2*x2 + 25.979*x2
}

# outer is the outer product of x1 and x2, where `FUN` is applied to
# each element
y <- outer(x1,x2,FUN=func)

# Plotly 3.4.1
library(plotly)
plot_ly(x=x1, y=x2, z=y, type='surface')

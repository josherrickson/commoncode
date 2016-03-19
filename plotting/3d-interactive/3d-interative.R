x1 <- seq(0, 50, length=30)
x2 <- seq(0, 0.55, length=30)

func <- function(x1, x2) {
  47.853 + 0.352*x1 - 0.009*x1^2 - 3.634*x1*x2 + 0.101*x1^2*x2 + 25.979*x2
}

y <- outer(x1,x2,func)

library(plotly)
plot_ly(x=x1, y=x2, z=y, type='surface')

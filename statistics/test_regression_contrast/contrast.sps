GLM y WITH x1 x2 x3
  /DESIGN=x1 x2 x1*x2 x3
  /PRINT=PARAMETER
  /LMATRIX x1 0 x2 1 x1*x2 -1 x3 0.

* Tests for, e.g. x2 = x1*x2
* See contrast.R for motivation

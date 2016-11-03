** Untested but should work **

sysuse auto
regress price c.weight##i.foreign##i.rep78

** Lets get the slope between weight and price within each foreign*rep78 subgroup.
margins, dydx(weight) over(foriegn rep78)

** To get pairwise comparisons:
margins, dydx(weight) over(foriegn rep78) pwcompare
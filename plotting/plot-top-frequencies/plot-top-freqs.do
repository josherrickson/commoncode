sysuse auto

// Tabulate all mpgs
tab mpg, descending

// Only top 5 frequencies
ssc install groups
groups mpg, order(h) select(5)

// Now lets plot only those top 5
// matcell and matrow save the results
tabulate mpg, sort matcell(freq) matrow(mpg)
// svmat turns those results into variables
svmat freq
svmat mpg
// drop the 6th through last (-1) entries if there are any
// since we only want the top 5
replace freq1 = . in 6/-1
replace mpg1 = . in 6/-1
graph bar freq1, over(mpg1)

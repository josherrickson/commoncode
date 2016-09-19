sysuse auto
regress price i.rep78

* First approach: Change baseline
regress price ib2.rep78

* Second approach: Use margins to view all pairwise
* (effects) gives both P-value and CI, use (pv) or (ci) for just one or the otehr
regress price i.rep78
margins rep78, pwcompare(eff)

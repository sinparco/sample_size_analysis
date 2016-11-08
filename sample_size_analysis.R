
#1 When no correlation exist in past research, smart with a medium effect size (I-O, r=.16)
psych::r.con(r=.16, n=100) # <-- interval width of .38, we need much higher to get the desired r=.16 level
psych::r.con(r=.16, n=600)

#2 When a correlation exist with a sample size // r=.25, N=200, we need to adjust the new n so that the intervals are less than or equal to .25.
psych::r.con(r=.25, n=100) # <-- Too Small
psych::r.con(r=.25, n=220) 

#2b Safeguard approach, calulate the CI of original study, use lowerbound of the CI. 
psych::r.con(r=.25, n=200) # <-- Lower bound = .12
psych::r.con(r=.12, n=100) # <-- Too small
psych::r.con(r=.12, n=1000)

#### Power ####
library(pwr)
#1 No correlation exist, assume r=.16, power=80
pwr.r.test(r=.16, power=.80) #We need a sample size of 303

#2 Previous correlation of r=.25 and N=200 exist.
pwr.r.test(r=.25, power=.80) # <-- Approach is flawed because we assume r=.25 is a perfect estimate of the population correlation

#3 Safeguard Power analyses
psych::r.con(r=.25, n=200) # <-- Lower bound = .12
pwr.r.test(r=.12, power=.80) # We will need a sample of 541.

Here's how we do this one:

accumulate the production rules into a substitution list

box the input string into pairs:  2 <\ s

NNCB becomes: [NN][NC][CB]
Perform the substitution on each box: [NCN][NBC][CHB]
Trim the last element from each box, because it's the same as the
first element of the next box: [NC][NB][CH]
unbox and concatenate them all:  NCNBCH
append the last element of the original: NCNBCHB


To generate the lookup table:

1. learn how i. and I. and e. and E. work
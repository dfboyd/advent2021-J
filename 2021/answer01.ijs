NB. Rotate the data leftward by one place, and then compare
NB. elementwise to the original array, producing a bit vector where
NB. 1's correspond to an increase.  Drop the final element,
NB. because it's the 0th compared with the last; and then just
NB. sum the result.

advent1 =: 3 : '+/ _1 }. y < 1 |. y'

NB. Another way to do the first star, using }. "behead" and }:
NB. "curtail", and compressing "(behead y) < (curtail y)" into a
NB. single verb train:

alt_advent1 =: 3 : '+/ (}: < }.) y'

NB. Partition the array into 3-element boxes.
NB. Sum the contents of each box, and unpack into a vector;
NB. then proceed as before.

advent1a =: 3 : 'advent1 > +/ each 3 <\ y'

NB. To do the second star, without using boxes:
NB. make a three-row matrix: 2nd and 3rd rows are
NB. shifted by one; then sum columns, and proceed as before

alt_advent1a =: 3 : 'alt_advent1 +/ (_2 }. y) , (1 }. _1 }. y) ,: 2 }. y'
alt_advent1b =: 3 : 'alt_advent1 2 }. +/ 0 1 2 }."0 1 y'


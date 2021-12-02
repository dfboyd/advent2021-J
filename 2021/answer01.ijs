NB. Rotate the data leftward by one place, and then compare
NB. elementwise to the original array, producing a bit vector where
NB. 1's correspond to an increase.  Drop the final element,
NB. because it's the 0th compared with the last; and then just
NB. sum the result.

advent1 =: 3 : '+/ _1 }. y < 1 |. y'

NB. Partition the array into 3-element boxes.
NB. Sum the contents of each box, and unpack into a vector;
NB. then proceed as before.

advent1a =: 3 : 'advent1 > +/ each 3 <\ y'

NB. Another way to do it using }. "behead" and }: "curtail", and
NB. compressing "(behead y) < (curtail y)" into a single train:

alt_advent1 =: 3 : '+/ (}: < }.) y'

NB. To do the second star, without using boxes:
NB. make a three-row matrix: first 
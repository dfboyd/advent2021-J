NB. answer 2

NB. This one requires some parsing of text, which isn't that
NB. convenient in J.  I kind of kludged it up because I was in a
NB. hurry.

NB. Save the input to 'input.txt', and you can read it into a string
NB. with, e.g.:
NB.    readfile < jpath '~/Downloads/input.txt'

readfile =: 1!:1

answer2a =: 3 : 0

    bxl =. ;: y
    NB.   Converts the input into a vector of boxes containing strings.
    NB.   +-------+-+-+----+-+-+-------+-+-+--+-+-+----+-+-+-------+-+-+
    NB.   |forward|5| |down|5| |forward|8| |up|3| |down|8| |forward|2| |
    NB.   +-------+-+-+----+-+-+-------+-+-+--+-+-+----+-+-+-------+-+-+

    bx =: ((3 %~ $ bxl), 3) $ bxl
    NB.   reshape the vector so it's N by 3

    words =. > {."1 bx
    NB.   "words" is the first column, i.e. the words


    forwards =. *./"1 'forward' ="1 words
	 ups =. *./"1 'up     ' ="1  words
       downs =. *./"1 'down   ' ="1  words
    NB.  Compare the string 'forward' to each of the words.
    NB.  You get all 1's if it's there, all 0's otherwise.
    NB.  AND-reduce that to get a single boolean for each row.
    NB.  "forwards" is a bit vector: 1 where the word was 'forward', else 0
    NB.  Similarly for "ups" and "downs"

    numbers =. > ". each 1 {"1 bx
    NB.  Take the 2nd column, and parse each string into an int,
    NB.  yielding a vector of boxes containing ints;
    NB.  then just unbox that into a vector.

    NB.  Now we have something like this:

    NB.  forwards    1  0  1  0  0  1
    NB.  ups         0  0  0  1  0  0
    NB.  downs       0  1  0  0  1  0
    NB.  numbers     5  5  8  3  8  2

    horiz =. +/ forwards # numbers
    NB.  So now we can select the forward elements and sum them:

    vert  =. (+/ (downs # numbers)) - +/ ups # numbers
    NB.  And we can select the up/down elements, and sum them,
    NB.  and subtract the ups from the downs to get the vertical position.

    horiz * vert
    NB.  ..and we return the product.
)

answer2b =: 3 : 0

    NB. The first part is all the same.
    bxl =. ;: y
    bx =: ((3 %~ $ bxl), 3) $ bxl
    words =. > {."1 bx
    forwards =. *./"1 'forward' ="1 words
	 ups =. *./"1 'up     ' ="1  words
       downs =. *./"1 'down   ' ="1  words
    numbers =. > ". each 1 {"1 bx

    horiz =. +/ forwards # numbers
    NB. The final horizontal position is the same as before.

    u_n =. - ups * numbers
    d_n =. downs * numbers
    NB.  We multiply instead of select, so we get the number vector
    NB.  with a value where there's an up / down, with zeroes elsewhere.

    aim =. +/\ u_n + d_n
    NB.  Calculate the running sum of the downs minus the ups, to give
    NB.  the "aim" at each step.

    verts =. forwards * numbers * aim
    NB.  Each time there's a forward, multiply that by the current aim
    NB.  to get the change in depth at that step.

    vert =. +/ verts
    NB.  Sum the changes in depth to get the final depth.

    horiz * vert
    NB.  Again, return the product.
)

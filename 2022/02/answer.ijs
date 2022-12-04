NB. How we're doing this:
NB. 0. precalculate the alphabet and the payoff matrices
NB. 1. slurp it in, strip all but letters, store in 'data'; one long string
NB. 2. enclose each pair, giving a list of boxes; index the payoff
NB.    matrix

NB. At first I thought they might upgrade to "rock paper scissors
NB. lizard spock" for phase 2, so I wrote a function to calculate the
NB. payoff matrix.  Turns out I didn't need to do that

boxdraw_j_ 1
readfile =: 1!:1

s =: readfile < 'example.txt'
s =: readfile < 'input.txt'

a =: 'ABCXYZ' NB. alphabet

data =: (s e. a) # s    NB. strips chars not in our alphabet, e.g. SPC, LF
                        NB. turns example input into 'AYBXCZ'

NB. We're going to generate payoff matrices, and index into them
NB. where 'ABC' choose row 0 1 2, and 'XYZ' choose column 0 1 2
NB. Easiest way to do that is just replace ABCXYZ with 0 1 2 3 4 5
NB. by doing:
NB.
NB.    a i. data
NB. 0 4 1 3 2 5
NB.
NB. and then mod by 3 to trim '3 4 5' back to '0 1 2'
NB.
NB.    3 | a i. data
NB. 0 1 1 0 2 2
NB.
NB. and then enclose each pair into a box:
NB.
NB.    _2 <\ 3 | a i. data
NB. +---+---+---+
NB. |0 1|1 0|2 2|
NB. +---+---+---+
NB.
NB. Then we can index the payoff matrix with those boxes, to get a
NB. vector of payoffs, which we then sum.

NB. pre-calculate the payoff matrix:

i =: i. 3                      NB. 0 1 2

ties =: 3 * e. @ i. 3          NB. matrix with 3 on diagonal, 0 elsewhere

wins =: 6 * ( 3 | i + 1 ) =/ i NB. matrix with 6 where you win, 0 elsewhere

pts  =: 3 3 $ 1 + i. 3         NB. matrix with 0 1 2 in each row
                               NB. (free points for choosing each item)

payoff1 =: ties + wins + pts

NB. hand-calculated the second payoff matrix
payoff2 =: (3 3 $ 0 3 6) + 3 3 $ 3 1 2 1 2 3 2 3 1

answer1 =: +/ payoff1 {~ _2 <\ 3 | a i. data

answer2 =: +/ payoff2 {~ _2 <\ 3 | a i. data

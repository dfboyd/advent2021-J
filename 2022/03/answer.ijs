readfile =: 1!:1
load 'strings'
boxdraw_j_ 1

NB. 1!:43 y     query current working directory
NB. 1!:44 y     set current working directory
NB. J starts up with current working directory set to ~/j903

s =: readfile < jcwdpath './example.txt'
s =: readfile < jcwdpath './input.txt'

NB. priorities: index of a letter is its priority
NB. e.g. 'z' is at position 26.
NB. So we prepend a space (could be any character) to shift everything over by 1
priorities =: ' ' , (26 {. (65 + 32) }. a.) , 26 {. 65 }. a.
NB. Alternatively:  priorities =: ' abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
NB. if you like just typing and are sure you didn't make a typo

data =: LF splitstring s

NB. given string, split it into its first and second halves
answer1 =: 3 : 0
  half_length =. -: # y   NB. halve length of y
  lhs =. half_length {. y NB. take first half
  rhs =. half_length }. y NB. get second half, by dropping first half
  priorities i. ({. ((lhs e. rhs) # lhs)) 
)

answer1 each data

intersect =: 4 : '((~. x) e. ~. y) # ~.x'

int =: 4 : '((~. x) e. ~. y) # ~.x'

answer2 =: 3 : 0
  items =: ' ' -.~ , int(/"2) _3 >\ data
  +/ priorities i. items
)

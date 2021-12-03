readfile =: 1!:1

s =:  readfile < jpath './2t.txt'

NB. strip newlines

stripnl =: 3 : ''

to_columns =: 3 : 0
  rows =. ($ y) % 6
  (rows,6) $ y
)

answer3 =: 3 : 0
  lines =: +/ LF = y
  NB. count linefeeds; that's how many lines there are
  
  oneline =. (-. LF = y) # y
  NB. strip out all the linefeeds, leaving just the 1s and 0s
  
  cols =. ($ oneline) % lines
  NB. find out how many chars per line there are
  
  bits =. '1' = (lines,cols) $ oneline
  NB. convert to numeric 1s and 0s.
  
  threshold =: lines % 2
  NB. the "majority" is just more than half the lines
  
  gammabits =: threshold <: +/ bits
  gamma =: #. gammabits
  epsilon =: #. -. gammabits
  gamma * epsilon
)

getbits =: 3 : 0
  lines =: +/ LF = y
  NB. count linefeeds; that's how many lines there are
  
  oneline =. (-. LF = y) # y
  NB. strip out all the linefeeds, leaving just the 1s and 0s
  
  cols =. ($ oneline) % lines
  NB. find out how many chars per line there are
  
  '1' = (lines,cols) $ oneline
  NB. convert to numeric 1s and 0s.
)

iter =: 3 : 0
  a =. y
  i =. 0
  while. 1 < rows =. 1 {. $ a
  NB. while a has more than one row
  do.
     freqs =: +/ a
     count =: i { freqs
     halfrows =: rows % 2
     bit =. halfrows <: count
     NB. eg. is count GE half the rows: most common bit is a 1

     bitcolumn =. i {"1 a
     NB. i'th column of a, as column vector

     if. bit = 0
     do.
        bitcolumn =. -. bitcolumn
     end.
     NB. bitvector: rows of a to keep

     a =. bitcolumn # a

     i =. 1 + i
  end.
  a return.
)

iter2 =: 3 : 0
  a =. y
  i =. 0
  while. 1 < rows =. 1 {. $ a
  NB. while a has more than one row
  do.
     freqs =: +/ a
     count =: i { freqs
     halfrows =: rows % 2
     bit =. -. halfrows <: count
     NB. bit is now the least common bit

     bitcolumn =. i {"1 a
     NB. i'th column of a, as column vector

     if. bit = 0
     do.
        bitcolumn =. -. bitcolumn
     end.

     a =. bitcolumn # a

     i =. 1 + i
  end.
  a return.
)

i =: readfile < jpath '~/Downloads/input3.txt'

ib =: getbits i

(#. iter ib) * (#. iter2 ib)
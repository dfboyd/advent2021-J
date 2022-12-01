NB. Save the input to 'input.txt', and you can read it into a string
NB. with, e.g.:
NB.    readfile < jpath '~/Downloads/input.txt'

readfile =: 1!:1

s =: readfile < jpath 'input.dat'

ss =: ;: s

data =: makenum (1 < (, > $ each ss)) # ss

result1 =: >./ +/"1 data

result2 =: +/ 3 {. \:~ +/"1 data


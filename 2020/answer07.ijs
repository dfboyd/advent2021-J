readfile =: 1!:1

load 'strings'

load 'regex'

t =: readfile < jpath '~/Code/adventJ/2020/test07.txt'

getbagname =: 3 : 0
   m =: '(.*) bags contain' rxmatch y
   if. (# m) > 1
   do.
     > (1 { '(.*) bags contain' rxmatch y) rxfrom y
   end.
)

answer07a =: 3 : 0
   lines =: LF splitstring y
   bagnames_raw =: getbagname each lines
   bagnames =: bagnames_raw #~ , 1 = > ($ & $) each bagnames_raw
)


answer07a t

NB. example: one green circuit assembler consumes 3 copper wires + 1 steel
NB. one copper wire assembler consumes 1 copper plate and produces 2 wires
NB.
NB.

NB. circuits  wires  steel_plates  copper_plates
NB. 1         _3     _1            0                   (circuit assembler)
NB. 0         1      0             _1                  (wire assembler)
NB. 0         0      1             0                   (steel plate input)
NB. 0         0      0             1                   (copper plate input)

matrix =: 4 4 $ 1 _3 _1 0  0 1 0 _1  0 0 1 0  0 0 0 1

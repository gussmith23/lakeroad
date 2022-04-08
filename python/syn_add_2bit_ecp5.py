from z3 import *
from lattice import ECP5Slice

solver = Solver()
slice_0 = ECP5Slice("slice_0")
slice_1 = ECP5Slice("slice_1")
slice_2 = ECP5Slice("slice_2")
slice_3 = ECP5Slice("slice_3")

operand_A = BitVec("operand_A", 2)
operand_B = BitVec("operand_B", 2)
inputs = Concat(operand_A, operand_B, operand_A, operand_B)
fxa = BitVec("fxa", 1)
fxb = BitVec("fxb", 1)
M0 = Bool("M0")
M1 = Bool("M1")
outputs = []
f0, f1, ofx0, ofx1 = slice_0(inputs, M0, M1, fxa, fxb)
outputs += [f0, f1]

output = Concat(*outputs)

solver.add(ForAll([operand_A, operand_B], output == operand_A + operand_B))

solver.check()
m = solver.model()
print(m)
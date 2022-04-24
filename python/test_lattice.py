from lattice import *
from z3 import *

def test_lattice():
  solver = Solver()
  slice_0 = Slice("slice_0", solver)
  slice_1 = Slice("slice_1", solver)
  slice_2 = Slice("slice_2", solver)
  slice_3 = Slice("slice_3", solver)

  operand_A = BitVec("operand_A", 2)
  operand_B = BitVec("operand_B", 2)
  inputs = Concat(operand_A, operand_B, operand_A, operand_B)
  fxa = BitVec("fxa", 1)
  fxb = BitVec("fxb", 1)
  outputs = []
  f0, f1, ofx0, ofx1 = slice_0(inputs, fxa, fxb)
  outputs += [f0, f1]

  output = Concat(*outputs)

  solver.add(ForAll([operand_A, operand_B], output == operand_A + operand_B))

  solver.check()
  m = solver.model()
  print(m)
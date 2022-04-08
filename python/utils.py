from z3 import *


def lut3(init, A, B, C):
    tmp = If(A, Extract(7, 4, init), Extract(3, 0, init))
    tmp = If(B, Extract(3, 2, tmp), Extract(1, 0, tmp))
    tmp = If(C, Extract(1, 1, tmp), Extract(0, 0, tmp))
    return tmp


def lut4(init, A, B, C, D):
    tmp = If(A, Extract(15, 8, init), Extract(7, 0, init))
    tmp = If(B, Extract(7, 4, tmp), Extract(3, 0, tmp))
    tmp = If(C, Extract(3, 2, tmp), Extract(1, 0, tmp))
    tmp = If(D, Extract(1, 1, tmp), Extract(0, 0, tmp))
    return tmp


def mux(C, A, B):
    return If(C, A, B)


def extract_to_bool_array(high, low, x):
    ret = []
    for i in range(high, low - 1, -1):
        xi = Extract(i, i, x)
        b = xi == BitVecVal(1, 1)
        ret.append(b)
    return ret


class LUT4:
    def __init__(self, prefix):
        self.prefix = prefix
        self.mem = BitVec(repr(self) + "_init", 16)

    def __call__(self, A, B, C, D):
        return lut4(self.mem, A, B, C, D)

    def __repr__(self) -> str:
        return self.prefix


class LUT3:
    def __init__(self, prefix) -> None:
        self.prefix = prefix
        self.mem = BitVec(repr(self) + "_init", 16)

    def __call__(self, A, B, C):
        return lut3(self.mem, A, B, C)

    def __repr__(self) -> str:
        return self.prefix


class MUX:
    def __init__(self, prefix):
        self.prefix = prefix

    def __call__(self, C, A, B):
        return mux(C, A, B)

    def __repr__(self) -> str:
        return self.prefix

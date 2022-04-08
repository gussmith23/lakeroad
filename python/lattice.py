from z3 import *
from utils import extract_to_bool_array, LUT4, MUX


class ECP5Slice:
    def __init__(self, prefix, mode="logic"):
        self.mode = mode
        self.prefix = prefix
        if mode == "logic":
            self.lut4_0 = LUT4(prefix + "_lut4_0")
            self.lut4_1 = LUT4(prefix + "_lut4_1")
            self.pfumx = MUX(prefix + "_PFUMX")
            self.l6mux21 = MUX(prefix + "_L6MUX21")
        else:
            raise NotImplementedError("Mode {} not implemented yet.".format(mode))
    
    def call_logic(self, inputs, M0, M1, FXA, FXB):
        F0 = self.lut4_0(*extract_to_bool_array(7, 4, inputs))
        F1 = self.lut4_1(*extract_to_bool_array(3, 0, inputs))
        OFX0 = self.pfumx(M0, F0, F1)
        OFX1 = self.l6mux21(M1, FXA, FXB)
        return F0, F1, OFX0, OFX1

    def __call__(self, *args):
        if self.mode == "logic":
            return self.call_logic(*args)
        
from z3 import *
from utils import MUX, LUT4, LUT3, extract_to_bool_array


class SOFALogicElement:
    def __init__(self, prefix, mode="LUT4+FF"):
        self.mode = mode
        self.prefix = prefix
        if mode == "LUT4+FF":
            self.lut4 = LUT4(prefix + "_lut4")
        elif mode == "Dual-LUT3":
            self.lut3_0 = LUT3(prefix + "_lut3_0")
            self.lut3_1 = LUT3(prefix + "_lut3_1")
        elif mode == "Shift-Register":
            raise NotImplementedError()
        else:
            raise KeyError("SOFA LogicElement has no mode {}.".format(mode))

    def call_lut4_ff(self, inputs):
        return self.lut4(*extract_to_bool_array(4, 0, inputs)), BitVecVal(1, 1)

    def call_dual_lut3(self, inputs):
        out0 = self.lut3_0(*extract_to_bool_array(4, 1, inputs))
        out1 = self.lut3_1(*extract_to_bool_array(3, 0, inputs))
        return out0, out1

    def call_shift_register():
        raise NotImplementedError()

    def __call__(self, *args):
        if self.mode == "LUT4+FF":
            return self.call_lut4_ff(*args)
        elif self.mode == "Dual-LUT3":
            return self.call_dual_lut3(*args)
        elif self.mode == "shift-register":
            return self.call_shift_register(*args)


class SOFACLB:
    def __init__(self, prefix, modes=None) -> None:
        if modes is None:
            modes = ["LUT4+FF" for _ in range(8)]
        else:
            assert len(modes) == 8
        self.modes = modes
        self.LEs = []
        for i, mode in enumerate(modes):
            self.LEs.append(SOFALogicElement(prefix + "_le{}".format(i), mode))

    def __call__(self, inputs):
        outputs = []
        for i in range(8):
            outputs += self.LEs[i](
                *extract_to_bool_array((8 - i) * 4 - 1, (8 - i - 1) * 4, inputs)
            )
        return outputs

Rarely (but on occasion), you may
wish to support a new architecture
Lakeroad. This is a walkthrough
of a few of the main steps one would
have to take when supporting a new 
architecture in Lakeroad. Specifically,
we are attempting to support 
mapping to DSPs on the Xilinx Virtex 6
architecture. Let's begin!

## Obtaining semantics of primitives
For each primitive that you want
Lakeroad to support, you'll need to
go through the import process. See
`importing.md` for more on how to do this.

## Creating a new architecture description.

- interface
  - internal data a set of symbolic values that we define, corresponding
  to different sett. These generally correspond to the things that
  we don't want to set manually, but are necessary to using the DSP
  correctly, and why this problem is difficult!
  - constraints are the constraints on symbolic values
  that we want the solver to abide by. These can come from 
  issues we had getting full functionality of the DSP, so we 
  must constrain some symbolic values to a certain domain to
  make sure that our model behaves as expected
  - modules
  this contains the exact spec of the ports and parameters 
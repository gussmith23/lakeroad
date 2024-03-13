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
  - ports exposed, internal data is the parameters that are symbolically set by the solver
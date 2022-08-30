# Verilog Modules for Importing

These Verilog modules are drawn from various repositories,
  and modified slightly so that Lakeroad's
  Verilog->Racket/Rosette importer
  can import them.
See the importer for details, but the primary modifications
  are the conversion of parameters to ports,
  conversion to the one-module-per-file convention
  standard among many Verilog tools,
  and the addition of include statements.

The Verilog modules that make up the SOFA architecture.
I needed to extract these out of various repositories
  so that I could convert them into the one-file-one-module
  format that Verilator expects.

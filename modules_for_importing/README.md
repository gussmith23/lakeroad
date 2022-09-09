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

It is of utmost importance that these modifications
  do not change the functionality of the modules.

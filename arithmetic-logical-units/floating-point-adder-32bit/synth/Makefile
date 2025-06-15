# Makefile for RTL Design Compiler automation

# Default target
.PHONY: all clean dcshell

run_all: clean synthesize

clean:
	@rm -r alib* *netlist* *.pvl *.log *.pdf *.mr *.syn *.svf 2>/dev/null || true
	@clear

synthesize:
	@dc_shell -f "floating_point_adder.tcl"



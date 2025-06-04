remove_design -all
set search_path {../lib}
set target_library {lsi_10k.db}
set link_library "* lsi_10k.db"

analyze -format verilog {../rtl/barrel_shifter.v} 

elaborate barrel_shifter

link 

check_design

current_design  barrel_shifter

compile_ultra

write_file -f verilog -hier -output barrel_shifter_netlist.v


 


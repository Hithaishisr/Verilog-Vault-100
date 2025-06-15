remove_design -all
set search_path {../lib}
set target_library {lsi_10k.db}
set link_library "* lsi_10k.db"

analyze -format verilog {../rtl/floating_point_adder.v} 

elaborate floating_point_adder

link 

check_design

current_design  floating_point_adder

compile_ultra

write_file -f verilog -hier -output floating_point_adder_netlist.v


 


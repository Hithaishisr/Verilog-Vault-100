remove_design -all
set search_path {../lib}
set target_library {lsi_10k.db}
set link_library "* lsi_10k.db"

analyze -format verilog {../rtl/non_restoring_divider.v} 

elaborate non_restoring_divider

link 

check_design

current_design  non_restoring_divider

compile_ultra

write_file -f verilog -hier -output non_restoring_divider_netlist.v


 


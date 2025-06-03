remove_design -all
set search_path {../lib}
set target_library {lsi_10k.db}
set link_library "* lsi_10k.db"

analyze -format verilog {../rtl/alu_16_bit.v} 

elaborate alu_16_bit

link 

check_design

current_design  alu_16_bit

compile_ultra

write_file -f verilog -hier -output alu_16_bit_netlist.v


 


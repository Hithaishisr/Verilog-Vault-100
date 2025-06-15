remove_design -all
set search_path {../lib}
set target_library {lsi_10k.db}
set link_library "* lsi_10k.db"

analyze -format verilog {../rtl/lzd.v} 

elaborate lzd

link 

check_design

current_design  lzd

compile_ultra

write_file -f verilog -hier -output lzd_netlist.v


 


#Liberty files are needed for logical and physical netlist designs
#set search_path "./"
#set link_library " "

set_app_var enable_lint true

configure_lint_setup -goal lint_rtl

analyze -verbose -format verilog {../rtl/barrel_shifter.v}

elaborate barrel_shifter

check_lint

report_lint -verbose -file report_lint_barrel_shifter.txt


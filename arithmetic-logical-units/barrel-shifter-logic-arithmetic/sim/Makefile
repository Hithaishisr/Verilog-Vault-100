# ========================
# Configurable Variables
# ========================
LIB_NAME = barrel_shifter
RTL_FILE = ../rtl/barrel_shifter.v
TB_FILE  = ../tb/barrel_shifter_tb.v
TOP_MODULE = barrel_shifter_tb

# ========================
# Default Target
# ========================
all: clean lib compile simulate

# ========================
# Step 1: Clean
# ========================
clean:
	@echo "Cleaning up simulation files..."
	@if [ -d "$(LIB_NAME)" ]; then rm -rf $(LIB_NAME); fi
	@rm -f transcript vsim.wlf *.log *.vstf *.bak *.ini *.vcd *.wlf *.ucdb *.idx *.dat *.do modelsim.ini
	@find . -maxdepth 1 -type f ! -name 'Makefile' -exec rm -f {} +
	@clear
	@echo "Cleanup complete."

# ========================
# Step 2: Create Library
# ========================
lib:
	@echo "Creating library $(LIB_NAME)..."
	vlib $(LIB_NAME)

# ========================
# Step 3: Compile Design and Testbench
# ========================
compile:
	@echo "Compiling RTL and Testbench..."
	vlog -work $(LIB_NAME) +acc $(RTL_FILE) $(TB_FILE)

# ========================
# Step 4: Run Simulation
# ========================
simulate:
	@echo "Starting simulation..."
	vsim -voptargs=+acc $(LIB_NAME).$(TOP_MODULE)

# ========================
# Phony Targets
# ========================
.PHONY: all clean lib compile simulate

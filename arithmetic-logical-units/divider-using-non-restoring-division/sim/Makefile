# ========================
# Configurable Variables
# ========================
LIB_NAME = non_restoring_divider
RTL_FILE = ../rtl/non_restoring_divider.v
TB_FILE  = ../tb/non_restoring_divider_tb.v
TOP_MODULE = non_restoring_divider_tb

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

# Parameterized Barrel Shifter Design and Verification

This project implements a parameterizable Barrel Shifter in Verilog, capable of performing both logical and arithmetic shifts in left and right directions. The design is generalized to support different data widths and shift amounts, making it scalable and reusable.

## 🔧 Project Structure

```
.
├── rtl/        # RTL source code for the Barrel Shifter
├── tb/         # Testbenches covering all shift operations
├── sim/        # Simulation outputs and logs
├── lint/       # SpyGlass linting reports
├── synth/      # Synopsys Design Compiler synthesis reports and gate-level netlist
└── README.md   # Project documentation
```

## 📂 RTL Design

- **File**: `rtl/barrel_shifter.v`
- **Description**: Implements a shift unit with the following features:
  - Parameterized data width (`data_width`)
  - Parameterized shift amount width (`shift_amt_width`)
  - Supports 4 shift operations:
    - Logical Left Shift
    - Logical Right Shift
    - Arithmetic Right Shift
    - (Arithmetic Left Shift is treated the same as logical left)
  - Operates as a combinational logic block

## 🧪 Testbench

- **Directory**: `tb/`
- **Coverage**:
  - Verifies each shift mode for various shift amounts and input patterns
  - Tests signed and unsigned behavior to validate arithmetic vs logical correctness
- **Simulation Tool**: SIEMENS QuestaSim

## 📊 Linting

- **Tool**: Synopsys VC SpyGlass
- **Directory**: `lint/`
- **Report**: Identifies unused logic, synthesis bottlenecks, and style violations for clean, industry-grade RTL.

## 🏗️ Synthesis

- **Tool**: Synopsys Design Compiler
- **Directory**: `synth/`
- **Output Files**:
  - `barrel_shifter_netlist.v`: Synthesized gate-level netlist
  - `schematic.pdf`: Post-synthesis schematic for visual inspection
- **Notes**: Synthesized targeting standard cell library `lsi_10k.db`.

## 📝 How to Run Simulations

1. Navigate to the `tb/` directory.
2. Use `QuestaSim` simulator with the provided `Makefile`:
   ```bash
   make all
   ```
3. View output waveforms or logs in the `sim/` folder.

## ✅ Deliverables Summary

| Deliverable                   | Status          |
|-------------------------------|-----------------|
| RTL Barrel Shifter Design     | ✅ Completed     |
| Testbench with Shift Modes    | ✅ Completed     |
| Linting via SpyGlass          | ✅ Passed        |
| Synthesis via Design Compiler | ✅ Completed     |
| Gate-Level Netlist            | ✅ Available     |
| Schematic Diagram             | ✅ Available     |

## 📌 Author

- Name: Hithaishi S R
- Profile: [LinkedIn](https://www.linkedin.com/in/hithaishisr)

## 📜 License

This project is intended for educational and learning purposes. Feel free to adapt and build upon it for your use.

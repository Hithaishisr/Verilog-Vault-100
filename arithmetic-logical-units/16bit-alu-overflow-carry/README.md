# 16-bit ALU Design and Verification

This project implements a 16-bit Arithmetic Logic Unit (ALU) in Verilog, accompanied by complete verification and analysis using industry-standard tools. It supports multiple ALU operations and includes comprehensive testbenches, linting reports, and synthesis results.

## 🔧 Project Structure

```
.
├── rtl/        # RTL source code for the ALU
├── tb/         # Testbenches covering all ALU operations
├── sim/        # Simulation outputs and logs
├── lint/       # SpyGlass linting reports
├── synth/      # Synopsys Design Compiler synthesis reports and gate-level netlist
└── README.md   # Project documentation
```

## 📂 RTL Design

- **File**: `rtl/alu_16_bit.v`
- **Description**: Implements a 16-bit ALU capable of performing:
  - Addition
  - Subtraction
  - AND
  - OR
  - XOR
  - NOT
  - Shift left/right
  - Comparison operations

## 🧪 Testbench

- **Directory**: `tb/`
- **Coverage**: Includes test cases for every supported `ALUOp` to verify functionality across all edge cases and typical usage patterns.
- **Simulation Tool**: SIEMENS QuestaSim

## 📊 Linting

- **Tool**: Synopsys VC SpyGlass
- **Directory**: `lint/`
- **Report**: Includes warnings, critical issues, and design suggestions to improve code quality and synthesis-friendliness.

## 🏗️ Synthesis

- **Tool**: Synopsys Design Compiler
- **Directory**: `synth/`
- **Output Files**:
  - `alu_16_bit_netlist.v`: Gate-level netlist
  - `schematic.pdf`: Post-synthesis schematic diagram
- **Notes**: Design was synthesized targeting the library `lsi_10k.db`.

## 📝 How to Run Simulations

1. Navigate to the `tb/` directory.
2. Use `QuestaSim` simulator with `Makefile` to compile and run the testbench:
   ```bash
   make all
   ```
3. Check outputs or waveform logs in the `sim/` directory.

## ✅ Deliverables Summary

| Deliverable              | Status   |
|--------------------------|----------|
| RTL Functional Design     | ✅ Completed |
| Testbench for Each ALUOp | ✅ Completed |
| Linting via SpyGlass      | ✅ Passed with reports |
| Synthesis (Design Compiler) | ✅ Completed |
| Gate-Level Netlist        | ✅ Available |
| Schematic PDF             | ✅ Available |

## 📌 Author

- Name: Hithaishi S R
- Profile: [LinkedIn](https://www.linkedin.com/in/hithaishisr)

## 📜 License

This project is for educational and demonstration purposes. Modify as needed for your use case.

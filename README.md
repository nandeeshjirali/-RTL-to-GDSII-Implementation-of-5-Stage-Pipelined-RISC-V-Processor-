# -RTL-to-GDSII-Implementation-of-5-Stage-Pipelined-RISC-V-Processor-
🚀 RTL-to-GDSII Implementation of a 5-Stage Pipelined RISC-V Processor
📖 Project Overview

This project presents the design and implementation of a 32-bit RISC-V Processor featuring a 5-stage pipeline architecture with support for custom Bit Manipulation Instructions.

The processor was developed using Verilog HDL and verified through simulation. The design was then synthesized to generate a gate-level netlist, demonstrating a complete RTL-to-GDSII ASIC Design Flow.

🎯 Objectives
Design a 32-bit RISC-V processor
Implement a 5-stage pipelined architecture
Support custom Bit Manipulation Instructions
Perform RTL verification and simulation
Generate gate-level netlist through synthesis
Demonstrate RTL-to-GDSII ASIC design methodology


🏗️ Processor Architecture
5-Stage Pipeline
1.Instruction Fetch (IF)
Fetch instruction from instruction memory
2.Instruction Decode (ID)
Decode instruction
Read source registers
3.Execute (EX)
Perform ALU operations
Execute bit manipulation instructions
4.Memory Access (MEM)
Access data memory
5.Write Back (WB)
Write result back to register file

⚙️ Supported Instructions

| Instruction | Description |
| ----------- | ----------- |
| ADD         | Addition    |
| SUB         | Subtraction |
| AND         | Logical AND |
| OR          | Logical OR  |
| XOR         | Logical XOR |

Bit Manipulation Extensions

| Instruction | Description             |
| ----------- | ----------------------- |
| ROR         | Rotate Right            |
| CLZ         | Count Leading Zeros     |
| CPOP        | Population Count        |
| MAX         | Maximum of Two Operands |

🧩 Major Modules
riscv_top.v
│
├── pc.v
├── instruction_mem.v
├── register_file.v
├── alu.v
├── control_unit.v
├── pipeline_regs.v
└── hazard_unit.v

🔄 Design Flow

RTL Design
    ↓
Functional Verification
    ↓
Simulation
    ↓
Logic Synthesis
    ↓
Gate-Level Netlist Generation
    ↓
Timing Analysis
    ↓
Physical Design
    ↓
GDSII


🛠️ Tools Used

Open Source ASIC Flow	RTL-to-GDSII Implementation
| Tool                  | Purpose                     |
| --------------------- | --------------------------- |
| Verilog HDL           | RTL Design                  |
| VS Code               | Development Environment     |
| Yosys                 | Logic Synthesis             |
| GTKWave               | Waveform Analysis           |
| Open Source ASIC Flow | RTL-to-GDSII Implementation 

📊 Results

Gate-Level Schematic:

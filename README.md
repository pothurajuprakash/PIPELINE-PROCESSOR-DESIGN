COMPANY: CODTECH IT SOLUTIONS

NAME: POTHURAJU PRAKASH

INTERN ID: CTIS3676

DOMAIN: VLSIRATION

DURATION: 6 MONTHS

MENTOR: NEELA SANTOSH KUMAR

Description:

The designed system implements a **4-stage pipelined processor architecture** using Verilog HDL, targeting fundamental VLSI design concepts such as parallel execution, instruction flow, and efficient hardware utilization. The processor supports a minimal instruction set consisting of **ADD, SUB, and LOAD operations**, which are sufficient to demonstrate arithmetic computation and memory access within a pipelined framework.

The pipeline is divided into four stages: **Instruction Fetch (IF), Instruction Decode (ID), Execute (EX), and Write Back (WB)**. Each stage performs a specific function and operates concurrently with other stages, enabling multiple instructions to be processed simultaneously. This parallelism significantly improves system throughput compared to non-pipelined designs.

In the **Instruction Fetch (IF)** stage, instructions are retrieved sequentially from the instruction memory using a program counter (PC). The PC is incremented on every clock cycle, ensuring continuous instruction flow into the pipeline. The fetched instruction is stored in the IF/ID pipeline register, which acts as an intermediate buffer between stages.

During the **Instruction Decode (ID)** stage, the fetched instruction is decoded into its constituent fields, including opcode, destination register, and source operands. The register file is accessed to retrieve operand values required for execution. The decoded information is then passed to the next stage via the ID/EX pipeline register.

The **Execute (EX)** stage performs the actual computation based on the opcode. For arithmetic instructions such as ADD and SUB, the Arithmetic Logic Unit (ALU) computes the result using values from the register file. For the LOAD instruction, the ALU calculates the memory address from which data is to be retrieved. The result of this stage is stored in the EX/WB pipeline register.

In the **Write Back (WB)** stage, the computed result is written back into the register file. For ADD and SUB operations, the ALU result is directly stored in the destination register. In the case of LOAD, data is fetched from data memory and then written into the specified register. This completes the execution cycle of an instruction.

The simulation output, visualized using EPWave (or GTKWave), clearly demonstrates the overlapping execution of instructions across pipeline stages. Signals such as clock (clk), reset (rst), input data (x_in), and output (y_out) are observed. Initially, when the reset signal is active, all internal registers and outputs are cleared to zero, ensuring a known starting state.

As the clock progresses, input values are applied sequentially, and the pipeline begins processing them. The waveform shows that while one instruction is in the execution stage, subsequent instructions are already being fetched and decoded. This overlapping behavior confirms correct pipeline operation. The output signal (y_out) reflects the cumulative effect of operations, particularly in designs like FIR filters or arithmetic pipelines, where previous inputs influence current outputs.

Additionally, internal signals such as intermediate registers (x0, x1, x2, x3) demonstrate data propagation across stages, validating the correctness of pipeline register implementation. The gradual change in output values over time confirms that computations are being performed correctly and sequentially propagated through the pipeline.

One important observation from the simulation is the **pipeline latency**. The first valid output appears only after a few clock cycles due to stage delays. However, once the pipeline is filled, outputs are generated in every clock cycle, showcasing improved efficiency.

Overall, this design successfully demonstrates the core principles of pipelined processor architecture in VLSI, including concurrency, stage-wise execution, and improved throughput. The simulation results validate the correctness of the design and highlight the benefits of pipelining in modern processor architectures.

OUTPUT:




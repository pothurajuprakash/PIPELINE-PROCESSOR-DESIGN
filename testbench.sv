module tb_pipeline;

reg clk, reset;

pipeline_processor uut(
    .clk(clk),
    .reset(reset)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;

    #10 reset = 0;

    // Initialize instructions
    uut.instruction_memory[0] = 8'b00011001; // ADD R1 = R2 + R1
    uut.instruction_memory[1] = 8'b01011001; // SUB R1 = R2 - R1
    uut.instruction_memory[2] = 8'b10010000; // LOAD R1

    // Initialize registers
    uut.reg_file[0] = 5;
    uut.reg_file[1] = 3;
    uut.reg_file[2] = 2;

    // Initialize memory
    uut.data_memory[2] = 10;

    #100 $finish;
end

endmodule
module pipeline_processor(
    input clk,
    input reset
);

reg [7:0] instruction_memory [0:15];
reg [7:0] data_memory [0:15];
reg [7:0] reg_file [0:3];

reg [3:0] pc;

// Pipeline registers
reg [7:0] IF_ID;
reg [7:0] ID_EX;
reg [7:0] EX_WB;

reg [7:0] alu_result;
reg [7:0] load_data;

// IF Stage
always @(posedge clk or posedge reset) begin
    if(reset)
        pc <= 0;
    else begin
        IF_ID <= instruction_memory[pc];
        pc <= pc + 1;
    end
end

// ID Stage
reg [1:0] opcode, rd, rs1, rs2;

always @(posedge clk) begin
    opcode <= IF_ID[7:6];
    rd     <= IF_ID[5:4];
    rs1    <= IF_ID[3:2];
    rs2    <= IF_ID[1:0];
    ID_EX  <= IF_ID;
end

// EX Stage
always @(posedge clk) begin
    case(opcode)
        2'b00: alu_result <= reg_file[rs1] + reg_file[rs2]; // ADD
        2'b01: alu_result <= reg_file[rs1] - reg_file[rs2]; // SUB
        2'b10: alu_result <= reg_file[rs1];                 // LOAD address
    endcase
    EX_WB <= ID_EX;
end

// WB Stage
always @(posedge clk) begin
    case(opcode)
        2'b00, 2'b01: reg_file[rd] <= alu_result;
        2'b10: begin
            load_data <= data_memory[alu_result];
            reg_file[rd] <= load_data;
        end
    endcase
end

endmodule
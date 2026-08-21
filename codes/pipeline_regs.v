// IF/ID Register
module if_id_reg(
    input clk,
    input reset,
    input [31:0] if_pc,
    input [31:0] if_instr,
    output reg [31:0] id_pc,
    output reg [31:0] id_instr
);

always @(posedge clk or posedge reset) begin

    if (reset) begin
        id_pc <= 0;
        id_instr <= 0;
    end

    else begin
        id_pc <= if_pc;
        id_instr <= if_instr;
    end

end

endmodule


// ID/EX Register
module id_ex_reg(
    input clk,
    input reset,
    input [3:0] id_alu_ctrl,
    input [31:0] id_reg_a,
    input [31:0] id_reg_b,
    input [31:0] id_imm,
    input [4:0] id_rd,

    output reg [3:0] ex_alu_ctrl,
    output reg [31:0] ex_reg_a,
    output reg [31:0] ex_reg_b,
    output reg [31:0] ex_imm,
    output reg [4:0] ex_rd
);

always @(posedge clk or posedge reset) begin

    if (reset) begin
        ex_alu_ctrl <= 0;
        ex_reg_a <= 0;
        ex_reg_b <= 0;
        ex_imm <= 0;
        ex_rd <= 0;
    end

    else begin
        ex_alu_ctrl <= id_alu_ctrl;
        ex_reg_a <= id_reg_a;
        ex_reg_b <= id_reg_b;
        ex_imm <= id_imm;
        ex_rd <= id_rd;
    end

end

endmodule


// EX/MEM Register
module ex_mem_reg(
    input clk,
    input reset,
    input [31:0] ex_result,
    input [4:0] ex_rd,

    output reg [31:0] mem_result,
    output reg [4:0] mem_rd
);

always @(posedge clk or posedge reset) begin

    if (reset) begin
        mem_result <= 0;
        mem_rd <= 0;
    end

    else begin
        mem_result <= ex_result;
        mem_rd <= ex_rd;
    end

end

endmodule


// MEM/WB Register
module mem_wb_reg(
    input clk,
    input reset,
    input [31:0] mem_result,
    input [4:0] mem_rd,

    output reg [31:0] wb_result,
    output reg [4:0] wb_rd
);

always @(posedge clk or posedge reset) begin

    if (reset) begin
        wb_result <= 0;
        wb_rd <= 0;
    end

    else begin
        wb_result <= mem_result;
        wb_rd <= mem_rd;
    end

end

endmodule
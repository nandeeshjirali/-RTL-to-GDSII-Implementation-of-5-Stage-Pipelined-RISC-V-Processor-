module riscv_top (

    input clk,
    input reset,
    output [7:0] final_result

);

// IF STAGE
wire [31:0] if_pc, if_instr;

// ID STAGE
wire [31:0] id_pc, id_instr;
wire [31:0] id_readdata1, id_readdata2;
wire [3:0] id_alu_ctrl;
wire [4:0] id_rd;

// EX STAGE
wire [31:0] ex_reg_a, ex_reg_b, ex_imm, ex_result;
wire [3:0] ex_alu_ctrl;
wire [4:0] ex_rd;
wire ex_zero;

// MEM STAGE
wire [31:0] mem_result;
wire [4:0] mem_rd;

// WB STAGE
wire [31:0] wb_result;
wire [4:0] wb_rd;

assign id_rd = id_instr[11:7];


// IF STAGE
pc prog_count (
    .clk(clk),
    .reset(reset),
    .pc_out(if_pc)
);

instruction_mem i_mem (
    .addr(if_pc),
    .instr(if_instr)
);

if_id_reg reg_if_id (
    .clk(clk),
    .reset(reset),
    .if_pc(if_pc),
    .if_instr(if_instr),
    .id_pc(id_pc),
    .id_instr(id_instr)
);


// ID STAGE
control_unit ctrl (
    .opcode(id_instr[6:0]),
    .funct3(id_instr[14:12]),
    .funct7(id_instr[31:25]),
    .alu_ctrl(id_alu_ctrl)
);

register_file reg_file (
    .clk(clk),
    .reg_write(1'b1),
    .rs1(id_instr[19:15]),
    .rs2(id_instr[24:20]),
    .rd(wb_rd),
    .write_data(wb_result),
    .read_data1(id_readdata1),
    .read_data2(id_readdata2)
);

id_ex_reg reg_id_ex (
    .clk(clk),
    .reset(reset),
    .id_alu_ctrl(id_alu_ctrl),
    .id_reg_a(id_readdata1),
    .id_reg_b(id_readdata2),
    .id_imm(32'b0),
    .id_rd(id_rd),

    .ex_alu_ctrl(ex_alu_ctrl),
    .ex_reg_a(ex_reg_a),
    .ex_reg_b(ex_reg_b),
    .ex_imm(ex_imm),
    .ex_rd(ex_rd)
);


// EX STAGE
alu main_alu (
    .a(ex_reg_a),
    .b(ex_reg_b),
    .alu_ctrl(ex_alu_ctrl),
    .result(ex_result),
    .zero(ex_zero)
);

ex_mem_reg reg_ex_mem (
    .clk(clk),
    .reset(reset),
    .ex_result(ex_result),
    .ex_rd(ex_rd),
    .mem_result(mem_result),
    .mem_rd(mem_rd)
);


// MEM STAGE
mem_wb_reg reg_mem_wb (
    .clk(clk),
    .reset(reset),
    .mem_result(mem_result),
    .mem_rd(mem_rd),
    .wb_result(wb_result),
    .wb_rd(wb_rd)
);


// WB STAGE
assign final_result = wb_result[7:0];

endmodule
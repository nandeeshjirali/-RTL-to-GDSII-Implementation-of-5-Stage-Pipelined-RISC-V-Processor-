module register_file (
    input clk,
    input reg_write,
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,
    input [31:0] write_data,

    output [31:0] read_data1,
    output [31:0] read_data2
);

reg [31:0] registers [31:0];

integer i;

initial begin

    for (i = 0; i < 32; i = i + 1)
        registers[i] = 0;

    registers[1] = 15;
    registers[2] = 10;

end

assign read_data1 = (rs1 == 0) ? 0 : registers[rs1];
assign read_data2 = (rs2 == 0) ? 0 : registers[rs2];

always @(posedge clk) begin

    if (reg_write && rd != 0)
        registers[rd] <= write_data;

end

endmodule
module instruction_mem(
    input [31:0] addr,
    output [31:0] instr
);

reg [31:0] rom [63:0];

initial begin

    rom[0] = 32'h002081b3; // ADD
    rom[1] = 32'h6020d233; // ROR
    rom[2] = 32'h600092b3; // CLZ
    rom[3] = 32'h60209333; // CPOP
    rom[4] = 32'h0a20e3b3; // MAX
    rom[5] = 32'h0000006f; // HALT

end

assign instr = (addr < 256) ? rom[addr[31:2]] : 32'h00000013;

endmodule


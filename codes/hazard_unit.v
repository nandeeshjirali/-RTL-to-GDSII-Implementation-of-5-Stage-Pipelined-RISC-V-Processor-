module hazard_unit(
    input [4:0] rs1, rs2, rd_ex, rd_mem,
    input reg_write_ex, reg_write_mem,
    output reg forward_a, forward_b
);

always @(*) begin

    forward_a = (reg_write_ex && (rd_ex != 0) && (rd_ex == rs1));
    forward_b = (reg_write_ex && (rd_ex != 0) && (rd_ex == rs2));

end

endmodule
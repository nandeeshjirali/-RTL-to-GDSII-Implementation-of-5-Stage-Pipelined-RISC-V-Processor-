`timescale 1ps/1ps

module alu_tb;

reg [31:0] a, b;
reg [3:0] alu_ctrl;

wire [31:0] result;
wire zero;

// Instantiate ALU
alu uut (
    .a(a),
    .b(b),
    .alu_ctrl(alu_ctrl),
    .result(result),
    .zero(zero)
);

initial begin

    // Generate waveform
    $dumpfile("alu_test.vcd");
    $dumpvars(0, alu_tb);

    // =====================
    // ADD TEST
    // =====================
    a = 32'd10;
    b = 32'd20;
    alu_ctrl = 4'b0000;

    #10;

    $display("ADD  : A=%0d B=%0d RESULT=%0d",
              a, b, result);

    // =====================
    // ROR TEST
    // =====================
    a = 32'h00000001;
    b = 32'd1;
    alu_ctrl = 4'b1000;

    #10;

    $display("ROR  : RESULT=%h", result);

    // =====================
    // CPOP TEST
    // =====================
    a = 32'b1011;
    b = 0;
    alu_ctrl = 4'b1010;

    #10;

    $display("CPOP : RESULT=%0d", result);

    // =====================
    // CLZ TEST
    // =====================
    a = 32'h00000001;
    b = 0;
    alu_ctrl = 4'b1011;

    #10;

    $display("CLZ  : RESULT=%0d", result);

    $display("ALU TEST COMPLETED");

    $finish;

end

endmodule
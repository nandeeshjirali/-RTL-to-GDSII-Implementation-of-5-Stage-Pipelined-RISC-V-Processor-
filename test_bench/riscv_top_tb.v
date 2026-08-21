module riscv_top_tb;

reg clk;
reg reset;

wire [7:0] final_result;

riscv_top uut (
    .clk(clk),
    .reset(reset),
    .final_result(final_result)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;

    #10 reset = 0;

    #120;

    $finish;

end

initial begin

    $dumpfile("pipeline_test.vcd");
    $dumpvars(0, riscv_top_tb);

end

endmodule
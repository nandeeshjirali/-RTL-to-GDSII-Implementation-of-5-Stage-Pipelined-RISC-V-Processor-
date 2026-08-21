module alu (
    input  [31:0] a,
    input  [31:0] b,
    input  [3:0]  alu_ctrl,
    output reg [31:0] result,
    output zero
);

assign zero = (result == 32'b0);

integer i;

always @(*) begin

    case (alu_ctrl)

        // ADD
        4'b0000:
            result = a + b;

        // SUB
        4'b0001:
            result = a - b;

        // ROR
        4'b1000:
            result = (a >> b[4:0]) | (a << (32 - b[4:0]));

        // MAX
        4'b1001:
            result = ($signed(a) > $signed(b)) ? a : b;

        // CPOP
        4'b1010: begin
            result = 0;

            for (i = 0; i < 32; i = i + 1)
                result = result + a[i];
        end

        // CLZ
        4'b1011: begin

            if (a[31])      result = 0;
            else if (a[30]) result = 1;
            else if (a[29]) result = 2;
            else if (a[28]) result = 3;
            else if (a[27]) result = 4;
            else if (a[26]) result = 5;
            else if (a[25]) result = 6;
            else if (a[24]) result = 7;
            else if (a[23]) result = 8;
            else if (a[22]) result = 9;
            else if (a[21]) result = 10;
            else if (a[20]) result = 11;
            else if (a[19]) result = 12;
            else if (a[18]) result = 13;
            else if (a[17]) result = 14;
            else if (a[16]) result = 15;
            else if (a[15]) result = 16;
            else if (a[14]) result = 17;
            else if (a[13]) result = 18;
            else if (a[12]) result = 19;
            else if (a[11]) result = 20;
            else if (a[10]) result = 21;
            else if (a[9])  result = 22;
            else if (a[8])  result = 23;
            else if (a[7])  result = 24;
            else if (a[6])  result = 25;
            else if (a[5])  result = 26;
            else if (a[4])  result = 27;
            else if (a[3])  result = 28;
            else if (a[2])  result = 29;
            else if (a[1])  result = 30;
            else if (a[0])  result = 31;
            else            result = 32;

        end

        default:
            result = 0;

    endcase

end

endmodule
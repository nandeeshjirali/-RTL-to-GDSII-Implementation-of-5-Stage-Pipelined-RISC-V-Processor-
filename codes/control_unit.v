module control_unit (
    input [6:0] opcode,
    input [2:0] funct3,
    input [6:0] funct7,
    output reg [3:0] alu_ctrl
);

always @(*) begin

    case (opcode)

        7'b0110011: begin

            case (funct3)

                // ADD / SUB
                3'b000:
                    alu_ctrl = (funct7 == 7'b0100000) ? 4'b0001 : 4'b0000;

                // ROR
                3'b101:
                    alu_ctrl = (funct7 == 7'b0110000) ? 4'b1000 : 4'b0000;

                // CLZ
                3'b001:
                    alu_ctrl = (funct7 == 7'b0110000) ? 4'b1011 : 4'b0000;

                // MAX
                3'b110:
                    alu_ctrl = (funct7 == 7'b0000101) ? 4'b1001 : 4'b0000;

                // CPOP
                3'b010:
                    alu_ctrl = (funct7 == 7'b0110000) ? 4'b1010 : 4'b0000;

                default:
                    alu_ctrl = 4'b0000;

            endcase
        end

        default:
            alu_ctrl = 4'b0000;

    endcase
end

endmodule
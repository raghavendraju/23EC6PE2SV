// -----------------------------------------------------------------------------
// File        : the_calculator.sv
// Author      : Raghavendra RAJU (1BM23EC200)
// Created     : 2026-02-30
// Module      : alu
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
// Description : ALU that performs arithmetic and logical operations.
// ----------------------------------------------------------------------------- 
typedef enum logic [1:0] {
    ADD = 2'b00,
    SUB = 2'b01,
    MUL = 2'b10,
    XOR = 2'b11
} opcode_t;

module alu (
    input  logic [7:0] a,
    input  logic [7:0] b,
    input  opcode_t   op,
    output logic [15:0] result
);

    always_comb begin
        case (op)
            ADD: result = a + b;
            SUB: result = a - b;
            MUL: result = a * b;
            XOR: result = a ^ b;
            default: result = 0;
        endcase
    end

endmodule

//------------------------------------------------------------------------------
// File        : design.sv
// Author      : Raghavendra Raju/ 1BM23EC200
// Created     : 2026-01-28
// Module      : and_gate
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : 2-input AND gate used for basic functional coverage example.
//------------------------------------------------------------------------------

module and_gate(
	input logic a, b,
  	output logic y
);
  assign y = a & b;
endmodule
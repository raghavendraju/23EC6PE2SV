// -----------------------------------------------------------------------------
// File        : dual_port.sv
// Author      : Raghavendra Raju (1BM23EC200)
// Created     : 2026-02-03
// Module      : dual_port_
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
// Description : Dual-port RAM allowing simultaneous write and 					 
//               read operations using separate addresses.
// ----------------------------------------------------------------------------- 
module dual_port (
  input logic clk,
  input logic we,
  input logic [5:0] addr_a,
  input logic [7:0] data_a,
  input logic [5:0] addr_b,
  output logic [7:0] data_b
);

  logic [7:0] mem [0:63];

  always_ff @(posedge clk) begin
    if (we)
      mem[addr_a] <= data_a;
  end

  always_ff @(posedge clk)
    data_b <= mem[addr_b];

endmodule
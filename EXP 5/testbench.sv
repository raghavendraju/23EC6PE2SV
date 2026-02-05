// -----------------------------------------------------------------------------
// File        : dff_tb.sv
// Author      : Raghavendra Raju(1BM23EC200)
// Created     : 2026-01-22
// Module      : tb
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Testbench to validate D flip-flop operation using clocked input
//               stimuli.

// ----------------------------------------------------------------------------- 
class packet;
  rand bit d, rst;

  // Weighted distribution
  constraint c1 {
    rst dist {0 := 90, 1 := 10};
  }
endclass


module tb;
  logic clk = 0;
  logic rst, d, q;

  dff dut (.*);

  // Clock generation
  always #5 clk = ~clk;
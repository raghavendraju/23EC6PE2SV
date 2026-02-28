// -----------------------------------------------------------------------------
// File        : clk_interface.sv
// Author      : Raghavendra Raju(1BM23EC200)
// Created     : 2026-02-24
// Module      : clk_interface
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
// Description : Digital clock that tracks time using counters.
// -----------------------------------------------------------------------------
interface clock_interface (input logic clk);

    logic reset;
    logic [5:0] seconds;
    logic [5:0] minutes;

    // Modport for DUT
    modport DUT (
        input  clk,
        input  reset,
        output seconds,
        output minutes
    );

    // Modport for Testbench
    modport TB (
        input  clk,
        output reset,
        input  seconds,
        input  minutes
    );

endinterface
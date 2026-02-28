//====================================================
// File: clk_tb.sv
// module: clk_tb
// Description: Top-level Testbench for digital clock
//====================================================

`timescale 1ns/1ps

module clk_tb;

    logic clk;
    initial clk = 0;
    always #5 clk = ~clk;

    clock_interface intf(clk);

    digital_clock dut (
        .clk(intf.clk),
        .reset(intf.reset),
        .seconds(intf.seconds),
        .minutes(intf.minutes)
    );

    clock_test test(intf);

    initial begin
      $dumpfile("digital_clock.vcd");
      $dumpvars(0,clk_tb);
    end

endmodule
// -----------------------------------------------------------------------------
// File        : clk_test.sv
// Author      : Raghavendra Raju(1BM23EC200)
// Created     : 2026-02-24
// Module      : clk_test
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
// Description : Digital clock that tracks time using counters.
// ----------------------------------------------------------------------------- 
program clk_test(clk_interface.TB intf);

    covergroup cg @(posedge intf.clk);

    seconds_val : coverpoint intf.seconds {
        bins sec_vals[] = {[0:59]};
    }

    minutes_val : coverpoint intf.minutes {
        bins min_vals[] = {[0:59]};
    }

    seconds_trans : coverpoint intf.seconds {
        bins sec_rollover = (59 => 0);
    }

    minutes_trans : coverpoint intf.minutes {
        bins min_rollover = (59 => 0);
    }

    cross seconds_val, minutes_val;

    endgroup

    cg coverage = new();

    property sec_limit;
    @(posedge intf.clk)
    disable iff (intf.reset)
    intf.seconds inside {[0:59]};
    endproperty

    property min_limit;
    @(posedge intf.clk)
    disable iff (intf.reset)
    intf.minutes inside {[0:59]};
    endproperty

    assert property(sec_limit)
    else $error("Seconds exceeded 59!");

    assert property(min_limit)
    else $error("Minutes exceeded 59!");

    initial begin

        intf.reset = 1;
        repeat (2) @(posedge intf.clk);
        intf.reset = 0;

        repeat (4000) @(posedge intf.clk);

      $display("Success : Simulation completed.");
        $finish;

    end

endprogram
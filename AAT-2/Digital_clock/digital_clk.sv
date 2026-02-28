// -----------------------------------------------------------------------------
// File        : digital_clk.sv
// Author      : Raghavendra Raju(1BM23EC200)
// Created     : 2026-02-24
// Module      : digital_clk
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : clock consists of two synchronized 6-bit counters representing 
//               seconds and minutes, each counting from 0 to 59. 
// -----------------------------------------------------------------------------

module digital_clk (
    input  logic        clk,
    input  logic        reset,        // Active-high synchronous reset
    output logic [5:0]  seconds,
    output logic [5:0]  minutes
);
    always_ff @(posedge clk) begin
        if (reset) begin
            seconds <= 6'd0;
            minutes <= 6'd0;
        end
        else begin
            if (seconds == 6'd59) begin
                seconds <= 6'd0;

                if (minutes == 6'd59)
                    minutes <= 6'd0;
                else
                    minutes <= minutes + 6'd1;
            end
            else begin
                seconds <= seconds + 6'd1;
            end
        end
    end
endmodule
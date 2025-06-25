`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2025 06:24:51 PM
// Design Name: 
// Module Name: metastability_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module metastability_tb();

    reg clk;
    reg async_in;
    wire sync_out;

    // Instantiate the DUT
    metastability uut (
        .clk(clk),
        .async_in(async_in),
        .sync_out(sync_out)
    );
    
    // Clock generator (period = 10ns)
    initial clk = 0;
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        $dumpfile("metastability.vcd");
        $dumpvars(0, metastability_tb);

        async_in = 0;

        // Change async_in in middle of clock period to induce potential metastability
        #12 async_in = 1;
        #7  async_in = 0;
        #3  async_in = 1;
        #9  async_in = 0;

        // Hold steady to allow stabilizing
        #50;

        $finish;
    end
    
endmodule

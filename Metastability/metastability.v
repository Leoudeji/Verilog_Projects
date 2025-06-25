`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2025 06:21:48 PM
// Design Name: 
// Module Name: metastability
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


module metastability(
    input wire clk,
    input wire async_in,
    output reg sync_out
    );
    
    reg sync_ff1;

    always @(posedge clk) begin
        sync_ff1  <= async_in; // first stage may become metastable
        sync_out  <= sync_ff1; // second stage likely resolves it
    end
    
endmodule

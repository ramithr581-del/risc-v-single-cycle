`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2026 20:04:15
// Design Name: 
// Module Name: dmem
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


module dmem(
    input  logic        clk,
    input  logic        we,
    input  logic [31:0] a,   // Address
    input  logic [31:0] wd,  // Write data
    output logic [31:0] rd   // Read data
);

    logic [31:0] mem [0:63];

    // Combinational read
    always_comb begin
        rd = mem[a[7:2]];
    end

    // Synchronous write on the rising edge
    always_ff @(posedge clk) begin
        if (we)
            mem[a[7:2]] <= wd;
    end

endmodule

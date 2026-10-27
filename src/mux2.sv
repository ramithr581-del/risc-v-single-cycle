`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2026 19:52:44
// Design Name: 
// Module Name: mux2
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


module mux2 #(parameter WIDTH = 8)(
    input  logic [WIDTH-1:0] d0,   // Input 0
    input  logic [WIDTH-1:0] d1,   // Input 1
    input  logic              s,   // Select line
    output logic [WIDTH-1:0]  y    // Output
    );

    always_comb begin
        if (s == 1'b0)
            y = d0;
        else
            y = d1;
    end

endmodule


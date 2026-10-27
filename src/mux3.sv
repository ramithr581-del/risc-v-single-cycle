`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2026 19:55:46
// Design Name: 
// Module Name: mux3
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


module mux3 #(parameter WIDTH = 8)(
    input  logic [WIDTH-1:0] d0,  // Input 0
    input  logic [WIDTH-1:0] d1,  // Input 1
    input  logic [WIDTH-1:0] d2,  // Input 2
    input  logic [1:0]       s,   // 2-bit Select line
    output logic [WIDTH-1:0] y    // Output
    );

    always_comb begin
        case (s)
            2'b00:   y = d0;
            2'b01:   y = d1;
            2'b10:   y = d2;
            default: y = '0;
        endcase
    end

endmodule

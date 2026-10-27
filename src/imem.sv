`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2026 20:20:23
// Design Name: 
// Module Name: imem
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


module imem(
    input  logic [31:0] a,   // Address
    output logic [31:0] rd   // Instruction
);

    logic [31:0] mem [0:63];

    // Initialize instruction memory from a text file
    initial begin
        $readmemh("imem.txt", mem);
    end

    // Combinational instruction read
    always_comb begin
        rd = mem[a[7:2]];
    end

endmodule